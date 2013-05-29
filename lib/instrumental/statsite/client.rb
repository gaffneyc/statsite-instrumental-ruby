require "socket"

module Instrumental
  module Statsite
    class Client
      def initialize(token, host = "collector.instrumentalapp.com", port = 8000)
        @token = token
        @host  = host
        @port  = port
      end

      def push(collector)
        ::TCPSocket.open(@host, @port) do |socket|
          socket.puts("hello version 1.0")
          socket.puts("authenticate #{@token}")

          if socket.readpartial(32) == "ok\nok\n"
            collector.each do |line|
              socket.puts(line)
            end

            collector.flush
          end
        end
      end

    end
  end
end
