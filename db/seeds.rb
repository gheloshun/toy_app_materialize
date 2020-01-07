# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create admin users
# Create a main sample user.
User.create!(first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: "adminuser",
  password_confirmation: "adminuser",
  admin: true)

99.times do |n|
  first_name = Faker::Name.name
  last_name = Faker::Name.name
  email = "sample-#{n+1}@sample.org"
  password = "password"
  User.create!(first_name: first_name,
              last_name: last_name,
              email: email,
              password: password,
              password_confirmation: password)
end
