require "stringio"
require "spec_helper"

describe Instrumental::Statsite::Parser do
  it "parses counts as increments" do
    collector = mock
    collector.should_receive(:increment).with("harmony.spam", "8", "410083200")

    data = StringIO.new("counts.harmony.spam|8|410083200\n")
    parser = Instrumental::Statsite::Parser.new(data)
    parser.parse(collector)
  end

  it "parses gauges as a gauge" do
    collector = mock
    collector.should_receive(:gauge).with("harmony.ham", "47.1111", "410083200")

    data = StringIO.new("gauges.harmony.ham|47.1111|410083200\n")
    parser = Instrumental::Statsite::Parser.new(data)
    parser.parse(collector)
  end

  it "parses sets as absolute gauges" do
    collector = mock
    collector.should_receive(:gauge_absolute).with(
      "harmony.render.time", "7222", "410083200"
    )

    data = StringIO.new("sets.harmony.render.time|7222|410083200\n")
    parser = Instrumental::Statsite::Parser.new(data)
    parser.parse(collector)
  end

  it "parses timers as absolute gauges" do
    collector = mock
    collector.should_receive(:gauge_absolute).with(
      "harmony.render.time", "7222", "410083200"
    )

    data = StringIO.new("timers.harmony.render.time|7222|410083200\n")
    parser = Instrumental::Statsite::Parser.new(data)
    parser.parse(collector)
  end
end
