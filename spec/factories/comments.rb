FactoryBot.define do
  factory :comment do
    association :post
    user { post.owner }
    
    sequence(:content) { |n| "Test post comment #{n}" }
  end
end
