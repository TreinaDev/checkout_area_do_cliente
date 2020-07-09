FactoryBot.define do
  factory :rejected_order do
    order_client
    reason { Faker::Lorem.paragraph }
  end
end
