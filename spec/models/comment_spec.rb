require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "comment factory　が有効" do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  it "コメント内容が空なら無効" do
    comment = FactoryBot.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors.full_messages).to include("Contentを入力してください")
  end
end
