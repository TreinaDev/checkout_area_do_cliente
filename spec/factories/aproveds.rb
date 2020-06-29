FactoryBot.define do
  factory :aproved do
    order_client { order_client.id }
    employee
  end
end
