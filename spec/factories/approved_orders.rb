FactoryBot.define do
  factory :approved_order do
    order_client
    bot_token { Faker::Code.nric }
  end
end
