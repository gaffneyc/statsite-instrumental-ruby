module Instrumental
  module Statsite
    # The collector generates the protocol to be sent to instrumental
    class Collector
      def initialize
        @buffer = []
      end

      def increment(key, value, timestamp)
        @buffer << "increment #{key} #{value} #{timestamp}"
      end

      def gauge(key, value, timestamp)
        @buffer << "gauge #{key} #{value} #{timestamp}"
      end

      def gauge_absolute(key, value, timestamp)
        @buffer << "gauge_absolute #{key} #{value} #{timestamp}"
      end

      def flush
        @buffer.clear
      end

      def each(&block)
        @buffer.each(&block)
      end

      def to_s
        @buffer.join("\n")
      end
    end
  end
end
