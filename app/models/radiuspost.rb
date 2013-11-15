# == Schema Information
#
# Table name: radiusposts
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  content       :string(255)
#  interest_id   :integer
#  interest      :string(255)
#  latitude      :float
#  longitude     :float
#  ip_address    :float
#  zipcode       :string(255)
#  visible       :boolean
#  group_id      :integer
#  group_name    :string(255)
#  eff_timestamp :datetime
#  expires_in    :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Radiuspost < ActiveRecord::Base
  attr_accessible :content, :user_id, :interest_id, :interest, :latitude, :longitude, :ip_address, :zipcode, :visible, :group_id, :group_name, :eff_timestamp, :expires_in
  belongs_to :user
  validates :content, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
  
  default_scope order: 'radiusposts.created_at DESC'
end
