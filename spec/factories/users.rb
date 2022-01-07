FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:email) { |n| "sample#{n}@example.com" }
    password { "password" }
  end
end
