class User < ActiveRecord::Base
	belongs_to :tag
  validates :latitude,  :inclusion => -90..90, :allow_nil => true
  validates :longitude,  :inclusion => -180..180, :allow_nil => true
  validates :vendor_id, :presence => true
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
