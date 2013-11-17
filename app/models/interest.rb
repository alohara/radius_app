# == Schema Information
#
# Table name: interests
#
#  id            :integer         not null, primary key
#  category      :string(255)
#  category_desc :string(255)
#  active        :boolean
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  reserved      :boolean         default(FALSE)
#

class Interest < ActiveRecord::Base
  audited
  attr_accessible :active, :category, :category_desc, :reserved
  has_many :radiusposts
  validates :category, presence: true
  validates :category_desc, presence: true

  def self.is_reserved(current_user)
    true_false = "true,false"
    if current_user.admin? || current_user.business?
	  where("reserved IN (#{true_false})")
	else
	  where(reserved: false)
	end
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['category LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
