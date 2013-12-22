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
#  twitter_acct    :boolean
#  twitter_id      :integer
#  tweet_since_id  :integer(8)
#

class User < ActiveRecord::Base
  audited
  attr_accessible :first_name, :last_name, :radius_name, :password, :password_confirmation, :active, :twitter_acct, :twitter_id, :tweet_since_id, :user_profile_attributes
  has_secure_password
  has_one :user_profile, foreign_key: "user_id", dependent: :destroy
  has_many :radiusposts, dependent: :destroy
  accepts_nested_attributes_for :user_profile, reject_if: :check_email_presence
  scope :tweeters, -> { where("twitter_acct = ?", true) }

  before_save { self.radius_name.downcase! }
  before_save :create_remember_token

  
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :radius_name, presence: true, length: { maximum: 25 },
            uniqueness: {case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
#  def feed
#    Radiuspost.where("user_id = ? and visible = ?", id, true)
##    Radiuspost.from_users_followed_by(self)
#  end
  private
    def create_remember_token
	  self.remember_token = SecureRandom.urlsafe_base64
	end  
	
    def check_email_presence(attributes)
	  if attributes['email'].blank? 
        @rad_name = self.radius_name
	    attributes['email'] = @rad_name +"@radiustemp.com"
		return false
	  else
	    return false
	  end
	end	
end
