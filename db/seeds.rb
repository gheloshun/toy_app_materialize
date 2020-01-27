User.create!(first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: "adminuser",
  password_confirmation: "adminuser",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
  first_name = Faker::Name.name
  last_name = Faker::Name.name
  email = "sample-#{n+1}@sample.org"
  password = "password"
  User.create!(first_name: first_name,
              last_name: last_name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

#create following users
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
