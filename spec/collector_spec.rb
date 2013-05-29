require "spec_helper"

describe Instrumental::Statsite::Collector do
  subject(:collector) do
    Instrumental::Statsite::Collector.new
  end

  describe "basic api" do
    it "can increment a value" do
      collector.increment("test", "15.822", "127000001")
      expect(collector.to_s).to eq("increment test 15.822 127000001")
    end

    it "can record a gauge" do
      collector.gauge("test100", "37", "127000002")
      expect(collector.to_s).to eq("gauge test100 37 127000002")
    end

    it "can record an absolute gauge" do
      collector.gauge_absolute("absolute", "99", "127000003")
      expect(collector.to_s).to eq("gauge_absolute absolute 99 127000003")
    end
  end

  describe "buffering" do
    it "buffers multiple calls together" do
      collector.increment("test", "15.822", "127000001")
      collector.gauge("test100", "37", "127000002")
      collector.gauge_absolute("absolute", "99", "127000003")

      data = collector.to_s.split("\n")
      expect(data.size).to be(3)
    end
  end
end
