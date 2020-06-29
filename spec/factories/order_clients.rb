FactoryBot.define do
  factory :order_client do
    token { "MyString" }
    plan { "MyString" }
    client { nil }
  end
end
