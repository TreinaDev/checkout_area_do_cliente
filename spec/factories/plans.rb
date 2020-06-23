FactoryBot.define do
  factory :plan do
    sequence(:platform) {|n| "Plataforma#{n}"}
    price { 2000.00 }
    limit_daily { 10000 }
    limit_monthly { 200 }
    cost  { 0.50 }
    promo { "Promoção" }
  end
end
