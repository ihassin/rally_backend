class AddAttributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :latitude, :float
  	add_column :users, :longitude, :float
  	add_column :users, :tag_id, :integer
  	add_column :users, :vendor_id, :string
  end
end
