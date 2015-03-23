require 'spec_helper'

describe Tag do

  before(:each) do
    @valid_attributes = {
        :name => "NYC"
    }
  end

  describe "validation" do
    context "invalid" do
      it "has a name" do
        a = Tag.new(@valid_attributes.merge(:name => nil))
        expect(a.valid?).to be(false)
      end

    end

    context "valid" do
      it "has a name" do
        a = Tag.new(@valid_attributes)
        expect(a.valid?).to be(true)
      end
    end

  end

end

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#
