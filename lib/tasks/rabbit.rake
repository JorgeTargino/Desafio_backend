desc "Inicia o rabbit"
task rabbit: [:environment] do
    require 'bunny'
    require 'json'

    connection = Bunny.new
    connection.start
    
    channel = connection.create_channel
    queue = channel.queue('update_subscription')
    
    begin
        puts ' [*] Aguardando mensagens. Para sair aperte CTRL+C'
        queue.subscribe(block: true) do |_delivery_info, _properties, body|
          puts "Recebido: #{body}"
          hash = JSON.parse(body)
          user = User.where(id: hash["user"]).first
          new_status = Status.where(id: hash["status"]).first
          if user.present? && new_status.present?
            sub = Subscription.where(user_id: user.id).first
            if sub.blank? 
              if new_status.id == 1
                sub = Subscription.create(user_id: user.id)
                sub.status_id = new_status.id
                sub.save
                EventHistory.create(subscription_id: sub.id, status_type: sub.status.status_name)
                puts 'Subscription realizada'
              else
                puts 'Status invalido para nova subscription'
              end
            else
              if new_status.id == 1
                puts 'Status invalido para subscription já criada'
              elsif (sub.status_id == 1 || sub.status_id == 3) && new_status.id == 2
                puts 'Subscription cancelada'
                sub.status_id = new_status.id
                sub.save
              elsif sub.status_id == 2 && new_status.id == 3
                puts 'Subscription reiniciada'
                sub.status_id = new_status.id
                sub.save
              else 
                puts 'Novo status invalido para subscription'
              end
            end
          elsif user.blank?
            puts "Erro: Usuário não cadastrado"
          elsif new_status.blank?
            puts "Erro: Status não cadastrado"
          end
          puts ''
          puts ''
        end
      rescue Interrupt => _
        connection.close
      
        exit(0)
      end
end