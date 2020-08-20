FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test title #{n}" }
    sequence(:text) { |n| "Test comment #{n}" }
    img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    user
  end
end
