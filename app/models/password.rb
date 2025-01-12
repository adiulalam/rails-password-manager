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
class Password < ApplicationRecord
  has_many :user_passwords
  has_many :passwords, through: :user_passwords

  encrypts :username, deterministic: true
  encrypts :password

  validates :url, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
