FactoryBot.define do
  factory :order_client do
    token { Faker::Code.nric }
    plan { Faker::Company.name }
    plan_id { 1 }
    client
    status { 0 }
  end
end
