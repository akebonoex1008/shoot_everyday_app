FactoryBot.define do
  factory :user, aliases: [:owner] do
    name "Spec Test"
    sequence(:email) { |n| "spec-#{n}@example.com" }
    password              "foobar"
    password_confirmation "foobar"
  end
end
