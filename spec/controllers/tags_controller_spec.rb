require 'spec_helper'

describe TagsController do

  before(:each) do
  end

  def iphone_data
    {
        :name => "Come say hi"
    }
  end

  describe "PUT create", :type => :controller do
    it "returns proper json to a tag create request" do
      post :create, :tag => iphone_data, :format => :json

      resp = JSON.parse(response.body)
      tag = resp['name']
      expect(tag).to_not be_nil

      expect(tag['id']).to_not eq(0)
    end
  end

  describe "PUT update" do
    it "updates tag info correctly" do
      tag = Tag.create! :name => 'Hi'

      put :update, :id => tag.id, :tag => iphone_data.merge(:name => 'new tag'), :format => :json

      expect(response.status).to eq 200
      tag.reload
      expect(tag.name).to eq 'new tag'
    end

  end

  describe "GET show", :type => :controller do
    it "returns proper json to a tag get request" do
      tag = Tag.create! :name => 'Hi'

      get :show, :id => tag.id, :format => :json

      resp = JSON.parse(response.body)
      tag = resp['name']

      expect(tag).to eq "Hi"
    end

  end
end
