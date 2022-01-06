require 'rails_helper'

RSpec.describe Task, type: :model do
  
  before do
    @user = User.create(email: "sample@example.com", password: "password")
  end

  it "タスク名、ユーザーがあれば有効な状態であること" do
    task = Task.new(name: "Sample Task", user: @user)
    expect(task).to be_valid
  end

  it "ユーザーがなければ無効な状態であること" do
    task = Task.new(name: "Sample Task", user: nil)
    expect(task).to_not be_valid
  end

  it "タスク名がなければ無効な状態であること" do
    task = Task.new(name: nil)
    task.valid?
    expect(task.errors).to be_present
  end

  it "タスク名が31文字以上の時は無効の状態であること" do
    task = Task.new(name: "a" * 31)
    task.valid?
    expect(task.errors).to be_present
  end

  

end
