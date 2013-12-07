# == Schema Information
#
# Table name: zipcodes
#
#  id          :integer         not null, primary key
#  zipcode     :string(255)
#  description :string(255)
#  city        :string(255)
#  subcity     :string(255)
#  latitude    :float
#  longitude   :float
#  active      :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Zipcode < ActiveRecord::Base
  audited
  attr_accessible :active, :city, :description, :latitude, :longitude, :subcity, :zipcode
  validates :zipcode, presence: true
  validates :subcity, presence: true
  
   def self.search(search)
    if search
      find(:all, :conditions => ['zipcode LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
