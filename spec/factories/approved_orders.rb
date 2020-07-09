FactoryBot.define do
  factory :approved_order do
    order_client { create(:order_client) }
  end
end
