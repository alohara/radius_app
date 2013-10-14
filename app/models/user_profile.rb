# == Schema Information
#
# Table name: user_profiles
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  email           :string(255)
#  default_zipcode :string(255)
#  default_radius  :integer
#  gender          :string(255)
#  latitude        :float
#  longitude       :float
#  security_one    :string(255)
#  answer_one      :string(255)
#  security_two    :string(255)
#  answer_two      :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class UserProfile < ActiveRecord::Base
  audited
  attr_accessible :email, :user_id, :default_zipcode, :default_radius, :gender, :security_one, :answer_one, :security_two, :answer_two
  belongs_to :user
  
  before_save { self.email.downcase! }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
				    uniqueness: { case_sensitive: false }

end
