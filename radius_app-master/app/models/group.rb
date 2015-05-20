# == Schema Information
#
# Table name: groups
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  radius_name :string(255)
#  group_id    :integer
#  group_name  :string(255)
#  group_desc  :string(255)
#  active      :boolean         default(FALSE)
#  admin       :boolean         default(FALSE)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Group < ActiveRecord::Base
  audited
  attr_accessible :active, :admin, :group_desc, :group_id, :group_name, :radius_name, :user_id
  has_many :radiusposts
  belongs_to :user
  validates :group_name, presence: true
  validates :group_desc, presence: true
end
