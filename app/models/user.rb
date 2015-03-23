class User < ActiveRecord::Base
	belongs_to :tag
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
