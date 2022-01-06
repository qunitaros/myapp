require 'rails_helper'

RSpec.describe Term, type: :model do
  
  before do
    @user = User.create(email: "sample@example.com", password: "password")
  end

  it "ユーザー、用語名があれば有効な状態であること" do
    term = Term.new(name: "Sample Term", user: @user)
    expect(term).to be_valid
  end

  it "ユーザーがなければ無効な状態であること" do
    term = Term.new(name: "Sample Task", user: nil)
    expect(term).to_not be_valid
  end

  it "用語名がなければ無効な状態であること" do
    term = Term.new(name: nil)
    expect(term).to_not be_valid
  end

  it "用語名の文字数が31文字以上だと無効な状態であること" do
    term = Term.new(name: "a" * 31)
    term.valid?
    expect(term.errors[:name]).to be_present
  end

end
