desc "Inicia o rabbit"
task :rabbit do
   
    require 'bunny'

    connection = Bunny.new
    connection.start

    #connection = Bunny.new(hostname: 'rabbit.local')
    #connection.start

    channel = connection.create_channel

    queue = channel.queue('hello')

    channel.default_exchange.publish('Hello World!', routing_key: queue.name)
    puts " [x] Sent 'Hello World!'"

    connection.close
end