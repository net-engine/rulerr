require "rulerr/version"

module Rulerr
  class Conversion
    DEFAULT_UNIT = 'cm'
    FACTOR_BY_UNIT = {
      'm'  => 1.0,
      'cm' => 100.0,
      'mm' => 1000.0,
      'px' => 3779.5275591,
      'pt' => 2834.64567,
      'in' => 39.37
    }

    attr_reader :number, :unit

    def initialize(value)
      @number = value.to_f
      @unit   = (
        value.match(/[a-z]{1,2}$/i).to_a[0] ||
        DEFAULT_UNIT
      ).downcase
    end

    # eg: "23.45cm" => "234.5mm"
    def to_mm
      to_m * FACTOR_BY_UNIT['mm']
    end

    def to_cm
      to_m * FACTOR_BY_UNIT['cm']
    end

    def to_m
      number / FACTOR_BY_UNIT[unit]
    end

    def to_px
      to_m * FACTOR_BY_UNIT['px']
    end

    def to_in
      to_m * FACTOR_BY_UNIT['in']
    end

    def to_pt
      to_m * FACTOR_BY_UNIT['pt']
    end
  end
end

