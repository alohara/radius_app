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

require 'spec_helper'

describe UserProfile do
  pending "add some examples to (or delete) #{__FILE__}"
end
