class Tag < ActiveRecord::Base
  validates :name, :presence => true
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
