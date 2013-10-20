# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  radius_name     :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#  business        :boolean         default(FALSE)
#  active          :boolean         default(TRUE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  audited
  attr_accessible :radius_name, :password, :password_confirmation, :user_profile_attributes
  has_secure_password
  has_one :user_profile, :foreign_key => "user_id"
  accepts_nested_attributes_for :user_profile
  
  before_save { self.radius_name.downcase! }
  
  #validates :first_name, presence: true, length: { maximum: 25 }
  #validates :last_name, presence: true, length: { maximum: 25 }
  validates :radius_name, presence: true, length: { maximum: 25 },
            uniqueness: {case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end