FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "sampletask#{n}" }
    description { "This is a sample task" }
    association :owner
  end
end
