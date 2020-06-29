FactoryBot.define do
  factory :order_client do
    token { Faker::Code.nric }
    plan { Faker::Name.unique.name }
  end
end
