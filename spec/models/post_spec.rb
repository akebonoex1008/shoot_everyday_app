require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "post factory　が有効" do
    expect(FactoryBot.build(:post)).to be_valid
  end
  
  it "画像だけがあれば投稿成功" do
    post = FactoryBot.build(:post, title: nil, text: nil)
    post.valid?
    expect(post).to be_valid
  end

  it "画像がなければ無効" do
    post = FactoryBot.build(:post, img: nil)
    post.valid?
    expect(post.errors.full_messages_for(:img)).to include("Imgを入力してください")
  end
end
