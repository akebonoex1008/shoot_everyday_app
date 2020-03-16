User.create!(
  name: "Test Tester",
  email: "test-1@example.com",
  password:              "foobar",
  password_confirmation: "foobar"
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n}@example.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password:              password,
    password_confirmation: password
  )
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }