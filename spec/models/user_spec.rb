require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe User do
    it "有効なファクトリを持つこと" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to be_present
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "aaa@example.com")
    user = FactoryBot.build(:user, email: "aaa@example.com")
    user.valid?
    expect(user.errors[:email]).to be_present
  end


end
