FactoryBot.define do
  factory :order do
    plan { Faker::Company.name }
    client
    status { 0 }
  end
end
