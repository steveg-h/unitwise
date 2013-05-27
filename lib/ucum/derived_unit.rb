module Ucum
  class DerivedUnit < Item
    attr_accessor :names, :symbol, :primary_code, :secondary_code
    attr_accessor :scale, :classification, :property, :metric, :special


    def self.key
      "derived_unit"
    end

  end
end