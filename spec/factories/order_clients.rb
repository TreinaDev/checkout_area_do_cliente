FactoryBot.define do
  factory :order_client do
    plan_id { 1 }
    client
    status { 0 }
  end
end
