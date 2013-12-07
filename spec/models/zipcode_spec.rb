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

require 'spec_helper'

describe Zipcode do
  pending "add some examples to (or delete) #{__FILE__}"
end
