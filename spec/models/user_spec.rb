require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "userファクトリが有効" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "姓、名、メール、パスワードがあれば有効" do
    user = User.new(
      name: "Spec Test",
      email: "spec-2@example.com",
      password:              "foobar",
      password_confirmation: "foobar"
    )
    expect(user).to be_valid
  end

  it "名がなければ無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages_for(:name)).to include("Nameを入力してください")
  end

  it "メールアドレスがなければ無効" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages_for(:email).first).to include("Eメールを入力してください")
  end

  it "メールアドレスが正しい値でなければ無効" do
    user = FactoryBot.build(:user, email: "abcefg")
    user.valid?
    expect(user.errors.full_messages_for(:email)).to include("Eメールは不正な値です")
  end

  it "重複したメールアドレスなら無効" do
    FactoryBot.create(:user, email: "spec-1@example.com")
    user = FactoryBot.build(:user, email: "spec-1@example.com")
    user.valid?
    expect(user.errors.full_messages_for(:email)).to include("Eメールはすでに存在します")
  end

  it "パスワードが６文字未満なら無効" do
    user = FactoryBot.build(:user,
      password: "fooba",
      password_confirmation: "fooba"
    )
    user.valid?
    expect(user.errors.full_messages_for(:password)).to include("パスワードは6文字以上で入力してください")
  end

  it "パスワードが確認用パスワードと違えば無効" do
    user = FactoryBot.build(:user,
      password: "fooba",
      password_confirmation: "foobv"
    )
    user.valid?
    expect(user.errors.full_messages_for(:password_confirmation)).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end
end
