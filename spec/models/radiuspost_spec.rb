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

require 'spec_helper'

describe Radiuspost do
  pending "add some examples to (or delete) #{__FILE__}"
end
