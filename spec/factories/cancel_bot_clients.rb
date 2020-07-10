FactoryBot.define do
  factory :cancel_bot_client do
    approved_order
    reason { Faker::Lorem.paragraph }
  end
end
