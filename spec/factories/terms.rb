FactoryBot.define do
  factory :term do
    sequence(:name) { |n| "sampleterm#{n}" }
    field { "sample field" }
    description { "This is a sample term." }
    association :owner
  end
end
