class AddRoleToUserPasswords < ActiveRecord::Migration[7.2]
  def change
    add_column :user_passwords, :role, :string
  end
end
