# == Schema Information
#
# Table name: user_passwords
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  password_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserPassword < ApplicationRecord
  belongs_to :user
  belongs_to :password
end
