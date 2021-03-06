require 'test_helper'

describe Unitwise::Unit do

  let(:ms2) { Unitwise::Unit.new("m/s2") }
  let(:kg)  { Unitwise::Unit.new("kg") }
  let(:psi) { Unitwise::Unit.new("[psi]")}
  let(:deg) { Unitwise::Unit.new("deg")}


  describe "#terms" do
    it "must be a collection of terms" do
      ms2.must_respond_to :terms
      ms2.terms.must_be_kind_of Enumerable
      ms2.terms.first.must_be_instance_of Unitwise::Term
    end
  end

  describe "#root_terms" do
    it "must be an array of Terms" do
      ms2.must_respond_to :terms
      ms2.root_terms.must_be_kind_of Array
      ms2.root_terms.first.must_be_instance_of Unitwise::Term
    end
  end

  describe "#scalar" do
    it "must return value relative to terminal atoms" do
      ms2.must_respond_to :scalar
      ms2.scalar.must_equal 1
      psi.scalar.must_equal 6894757.293168359
      deg.scalar.must_equal 0.017453292519943295
    end
  end

  describe "#composition" do
    it "must be a multiset" do
      ms2.must_respond_to :terms
      ms2.composition.must_be_instance_of SignedMultiset
    end
  end

  describe "#dim" do
    it "must be a string representing it's dimensional makeup" do
      ms2.dim.must_equal 'L.T-2'
      psi.dim.must_equal 'L-1.M.T-2'
    end
  end

  describe "#*" do
    it "should multiply units" do
      mult = kg * ms2
      mult.expression.to_s.must_match(/kg.*\/s2/)
      mult.expression.to_s.must_match(/m.*\/s2/)
    end
  end

  describe "#/" do
    it "should divide units" do
      div = kg / ms2
      div.expression.to_s.must_match(/kg.*\/m/)
      div.expression.to_s.must_match(/s2.*\/m/)
    end
  end

  describe "#frozen?" do
    it "should be frozen" do
      kg.frozen?.must_equal true
    end
  end

end
