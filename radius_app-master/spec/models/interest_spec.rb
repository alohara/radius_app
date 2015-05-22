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

require 'spec_helper'

describe Interest do
  pending "add some examples to (or delete) #{__FILE__}"
end
