FactoryBot.define do
  factory :title do
    discount { 1 }
    start_date { "2020-06-30" }
    end_date { "2020-06-30" }
    limit_order { 1 }
  end
end