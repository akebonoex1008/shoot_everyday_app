User.create!(
  name: "Test Tester",
  email: "tester-1@example.com",
  password:              "foobar",
  password_confirmation: "foobar",
  profile_image: open("#{Rails.root}/db/sample/profile/profile-3.jpg")
)

# 簡単ログイン（ゲスト）
User.create!(
  name: "ゲスト",
  email: "guest-1@example.com",
  password:              "foobar",
  password_confirmation: "foobar",
  profile_image: open("#{Rails.root}/db/sample/profile/profile-2.jpg")
)


# users
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n}@example.com"
  password = "password"
  img = open("#{Rails.root}/db/sample/profile/profile-1.jpg")
  User.create!(
    name: name,
    email: email,
    password:              password,
    password_confirmation: password,
    profile_image: img
  )
end

users = User.all
user  = users.first
user2 = users.second

# posts
30.times do |n|
    title = "title1-#{n}"
    text = Faker::Lorem.sentence
    img = open("#{Rails.root}/db/sample/profile/profile-2.jpg")
    user.posts.create!(
      title: title,
      text: text,
      img: img
    )
end

30.times do |n|
    title = "title2-#{n}"
    text = Faker::Lorem.sentence
    img = open("#{Rails.root}/db/sample/profile/profile-1.jpg")
    user2.posts.create!(
      title: title,
      text: text,
      img: img
    )
end

# リレーションシップ
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }