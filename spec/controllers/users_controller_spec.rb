require 'spec_helper'

describe UsersController do

  before(:each) do
  end

  def iphone_data
    {
        :latitude => 1,
        :longitude => 2,
        :vendor_id => 'abc-def',
        :tag_id => 3
    }
  end

  describe "PUT create", :type => :controller do
    it "returns proper json to a user create request" do
      post :create, :user => iphone_data, :format => :json

      resp = JSON.parse(response.body)
      expect(response.status).to eq 201

      expect(resp['id']).to_not eq(0)
      expect(resp['latitude']).to eq(1)
      expect(resp['longitude']).to eq(2)
      expect(resp['vendor_id']).to eq('abc-def')
      expect(resp['tag_id']).to eq(3)
    end
  end

  describe "PUT update" do
    it "updates user info correctly" do
      user = User.create! iphone_data

      put :update, :id => user.id, :user => iphone_data.merge(:latitude => 90), :format => :json

      expect(response.status).to eq 200
      user.reload
      expect(user.latitude).to eq(90)
    end

  end

  describe "GET show", :type => :controller do
    it "returns proper json to a user get request" do
      user = User.create! iphone_data

      get :show, :id => user.id, :format => :json

      resp = JSON.parse(response.body)
      expect(response.status).to eq 200

      expect(resp['latitude']).to eq 1
    end

  end

  describe "GET index", :type => :controller do
    it "returns proper json to a user index request" do
      user1 = User.create! iphone_data
      user2 = User.create! iphone_data

      get :index, :format => :json

      resp = JSON.parse(response.body)
      expect(response.status).to eq 200

      expect(resp.length).to eq 2
    end

  end

  describe "Delete", :type => :controller do
    it "returns proper json to a user delete request" do
      user1 = User.create! iphone_data
      user2 = User.create! iphone_data

      delete :destroy, :id => user1.id, :format => :json

      expect(response.status).to eq 200
      expect(User.all.count).to eq 1
    end

  end
end
