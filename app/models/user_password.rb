# == Schema Information
#
# Table name: user_passwords
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  password_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :string
#
class UserPassword < ApplicationRecord
  # View can only view the password
  # Editor can update the password
  # Owner view, edit, and share the password
  ROLES = %w[viewer editor owner]

  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: { in: ROLES }

  attribute :role, default: :viewer

  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end

  private

  def owner?
    role == "owner"
  end

  def viewer?
    role == "viewer"
  end

  def editor?
    role == "editor"
  end
end
