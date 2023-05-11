desc "Inicia o rabbit"
task rabbit: [:environment] do
    require 'bunny'
    require 'json'

    connection = Bunny.new
    connection.start
    
    channel = connection.create_channel
    queue = channel.queue('update_subscription')
    
    

    begin
        puts ' [*] Waiting for messages. To exit press CTRL+C'
        queue.subscribe(block: true) do |_delivery_info, _properties, body|
            puts "Recebido: #{body}"
            hash = JSON.parse(body)
            user = User.where(id: hash["user"]).first
            new_status = Status.where(id: hash["status"]).first
            if user.present? && new_status.present?
                Subscription.first_or_create(user_id: user.id).update(status_id: new_status.id)
              puts "User encontrado"
            elsif user.blank?
              puts "Erro: User não cadastrado"
            elsif new_status.blank?
                puts "Status não encontrado"
            end
            puts ''
            puts ''
            puts ''
        end
      rescue Interrupt => _
        connection.close
      
        exit(0)
      end
end