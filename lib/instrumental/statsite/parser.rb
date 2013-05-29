module Instrumental
  module Statsite
    class Parser
      FORMAT = /\A(?<type>counts|gauges|sets|timers)\.(?<data>.+)\n?\z/

      attr_reader :errors

      def initialize(stream)
        @stream = stream
        @errors = []
      end

      # Parse the input and pass along the proper calls to the collector
      def parse(collector)
        @stream.each_line do |line|
          if match = FORMAT.match(line)

            key, value, timestamp = match[:data].split("|")

            case match[:type]
            when "counts"
              collector.increment(key, value, timestamp)
            when "gauges"
              collector.gauge(key, value, timestamp)
            when "sets", "timers"
              collector.gauge_absolute(key, value, timestamp)
            end
          else
            @errors << "Unable to process: #{line}"
          end
        end
      end
    end
  end
end
