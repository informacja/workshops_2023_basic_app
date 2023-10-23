require 'bunny'

class Publishers::Application

    def initialize(routing_key:, exchange_name:, message:)
        @message = message
        @exchange_name = exchange_name
        @routing_key = routing_key
    end

    def connection_options
    {
        host: "localhost",
        port: "5672",
        vhost: "/",
        username: "guest",
        password: "guest"
    }
    end
    
    def connection
        @connection ||= Bunny.new(connection_options)
    end
    
    def perform
        connection.start
        channel = connection.create_channel
        @createdExchange = channel.direct(@exchange_name)
        @createdExchange.publish(@message.to_json, routing_key: @routing_key)
        connection.close
    end

end

