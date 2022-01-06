require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "メールアドレス、パスワードがあれば有効な状態であること" do
    user = User.new(
      email: "sample@example.com", password: "password"
    )
    expect(user).to be_valid
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to be_present
  end

  it "重複したメールアドレスなら無効な状態であること" do
    User.create(email: "sample@example.com", password: "password")
    user = User.new(email: "sample@example.com", password: "sample")
    user.valid?
    expect(user.errors[:email]).to be_present
  end


end
