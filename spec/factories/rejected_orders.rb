FactoryBot.define do
  factory :rejected_order do
    order_client { nil }
    reason { "MyText" }
  end
end
