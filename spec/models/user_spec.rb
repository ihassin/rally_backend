require 'spec_helper'

describe User do

  before(:each) do
    @valid_attributes = {
        :latitude => 85.1,
        :longitude => 90
    }
  end

  describe "validation" do
    context "invalid latitude" do
      it "cannot have a nil value" do
        a = User.new(@valid_attributes.merge(:latitude => nil))
        expect(a.valid?).to be(false)
      end
      it "cannot have a bad negative value" do
        a = User.new(@valid_attributes.merge(:latitude => -90.1))
        expect(a.valid?).to be(false)
      end
      it "cannot have a bad positive value" do
        a = User.new(@valid_attributes.merge(:latitude => 90.1))
        expect(a.valid?).to be(false)
      end

    end

    context "valid latitude" do
      it "has a valid latitude" do
        a = User.new(@valid_attributes)
        expect(a.valid?).to be(true)
      end
    end

    context "invalid longitude" do
      it "cannot have a nil value" do
        a = User.new(@valid_attributes.merge(:longitude => nil))
        expect(a.valid?).to be(false)
      end
      it "cannot have a bad negative value" do
        a = User.new(@valid_attributes.merge(:longitude => -180.1))
        expect(a.valid?).to be(false)
      end
      it "cannot have a bad positive value" do
        a = User.new(@valid_attributes.merge(:longitude => 180.1))
        expect(a.valid?).to be(false)
      end

    end

    context "valid longitude" do
      it "has a valid longitude" do
        a = User.new(@valid_attributes)
        expect(a.valid?).to be(true)
      end
    end
  end

end
