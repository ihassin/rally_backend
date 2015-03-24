require 'spec_helper'

describe User do

  before(:each) do
    @valid_attributes = {
        :latitude => 85.1,
        :longitude => 90,
        :vendor_id => "abcde"
    }
  end

  describe "validation" do
    describe "latitude" do
      context "invalid latitude" do
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
          a = User.new(@valid_attributes.merge(:latitude => 0))
          expect(a.valid?).to be(true)
        end
        it "has a nil value" do
          a = User.new(@valid_attributes.merge(:latitude => nil))
          expect(a.valid?).to be(true)
        end
      end
    end

    describe "longitude" do
      context "invalid longitude" do
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
          a = User.new(@valid_attributes.merge(:longitude => 0))
          expect(a.valid?).to be(true)
        end
        it "has a nil longitude" do
          a = User.new(@valid_attributes.merge(:longitude => nil))
          expect(a.valid?).to be(true)
        end
      end
    end

    describe "vendor id" do
      context "valid vendor id" do
        it "has a valid vendor id" do
          a = User.new(@valid_attributes)
          expect(a.valid?).to be(true)
        end
      end

      context "invalid vendor id" do
        it "has a invalid vendor id" do
          a = User.new(@valid_attributes.merge(:vendor_id => nil))
          expect(a.valid?).to be(false)
        end
      end
    end

  end

end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#  tag_id     :integer
#  vendor_id  :string(255)
#
