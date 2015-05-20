require 'spec_helper'

describe Rulerr::Conversion do
  describe '#to_m' do
    it "converts a meter into a meter" do
      expect(described_class.new("1 m").to_m).to eq(1.0)
    end

    it "converts a cm into 0.01 meters" do
      expect(described_class.new("1 cm").to_m).to eq(0.01)
    end

    it "converts a cm into 10 mm" do
      expect(described_class.new("1 cm").to_mm).to eq(10)
    end

    it "converts a cm into 10 mm" do
      expect(described_class.new("1cm").to_mm).to eq(10)
    end

    it "converts a cm into 38 px" do
      expect(described_class.new("1.0 cm").to_px).to eq(37.795275591)
    end

    it "converts a meter into inches" do
      expect(described_class.new("1.0 m").to_in).to eq(39.37)
    end

    it "converts a 8.89 in into mm" do
      expect(described_class.new("8.89 in").to_mm).to eq(225.80645161290326)
    end
  end
end
