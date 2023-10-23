require 'bunny'

class Publishers::LoanBookPublisher

    def initialize( message:)
        @message = message
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
        Publishers::Application.new(routing_key: 'PSW_routing_key',
            exchange_name: 'PSW_exchange',
            message: { test: @message }
            ).perform
    end

    def publish
        ::Publishers::Application.new(
          routing_key: 'basic_app.book_loans',
          exchange_name: 'basic_app',
          message: @message
        ).perform
      end

end
