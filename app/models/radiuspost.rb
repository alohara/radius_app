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
#  radius_name   :string(255)
#  city          :string(255)
#  subcity       :string(255)
#

class Radiuspost < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  attr_accessible :content, :user_id, :interest_id, :interest, :latitude, :longitude, :ip_address, :zipcode, :visible, :group_id, :group_name, :eff_timestamp, :expires_in
  belongs_to :user
  validates :content, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
  
  default_scope order: 'radiusposts.created_at DESC'
  

  def self.search(search, lat, lon)
    if search.nil?
     Radiuspost.within(1, :origin => [lat, lon])
#    find(:all)     
    else
	  if search = ""
        Radiuspost.within(1, :origin => [lat, lon])
	  else
        find(:all, :conditions => ['zipcode LIKE ?', "%#{search}%"])
	  end
    end
  end
  
  def feed
    Radiuspost.where("visible = ?", true)
  end
end
