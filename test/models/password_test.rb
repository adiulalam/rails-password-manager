# == Schema Information
#
# Table name: passwords
#
#  id         :bigint           not null, primary key
#  url        :string
#  username   :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PasswordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
