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

require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end
