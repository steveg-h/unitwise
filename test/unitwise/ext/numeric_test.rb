require 'test_helper'
require 'unitwise/ext'
describe Numeric do

  describe "#convert" do
    it "must work for Integer" do
      measurement = 22.convert_to("kg")
      measurement.must_be_instance_of(Unitwise::Measurement)
      measurement.value.must_equal 22
    end
    it "must work for Fixnum" do
      measurement = 24.25.convert_to("[ft_i]")
      measurement.must_be_instance_of(Unitwise::Measurement)
      measurement.value.must_equal 24.25
    end
    it "must work for Float" do
      measurement = (22.0/7).convert_to("[mi_i]")
      measurement.must_be_instance_of(Unitwise::Measurement)
      measurement.value.must_equal 3.142857142857143
    end
    it "must work for Rational" do
      measurement = Rational(22/7).convert_to("N/m2")
      measurement.must_be_instance_of(Unitwise::Measurement)
      measurement.value.must_equal Rational(22/7)
    end
  end

  describe "#method_missing" do
    it "must match 'mm'" do
      mm = 2.5.mm
      mm.must_be_instance_of(Unitwise::Measurement)
      mm.value.must_equal 2.5
    end
    it "must match 'to_mm'" do
      mm = 2.5.to_mm
      mm.must_be_instance_of(Unitwise::Measurement)
      mm.value.must_equal 2.5
    end

    it "must not match 'foo'" do
      lambda { 1.foo }.must_raise NoMethodError
    end

    it "must not match 'to_foo'" do
      lambda { 1.to_foo }.must_raise NoMethodError
    end

  end


end