require 'faker'

puts "Seeding data..."

# Clear existing records to avoid duplication
UserPassword.destroy_all
Password.destroy_all
User.destroy_all

# Create users
users = []
3.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end
puts "Created #{users.count} users."

# Create passwords
passwords = []
5.times do
  passwords << Password.create!(
    url: Faker::Internet.url,
    username: Faker::Internet.username,
    password: Faker::Internet.password
  )
end
puts "Created #{passwords.count} passwords."

# Assign roles to users for passwords
roles = UserPassword::ROLES
users.each do |user|
  passwords.each do |password|
    role = roles.sample # Randomly assign a role
    UserPassword.create!(
      user: user,
      password: password,
      role: role
    )
  end
end
puts "Assigned roles to users for passwords."

puts "Seeding complete!"
