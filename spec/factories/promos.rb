FactoryBot.define do
  factory :promo do
    title { Faker::Commerce.product_name }
    discount { 1 }
    start_date { Time.zone.today }
    end_date { 7.days.from_now }
    limit_order { 1 }
  end
end
