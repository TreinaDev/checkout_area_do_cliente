FactoryBot.define do
  factory :company do
    fantasy_name { 'Mc Donalds' }
    corporate_name { 'Arcos Dourados' }
    email { Faker::Internet.email }
    document_number { Faker::Company.brazilian_company_number(formatted: true) }
    address { Faker::Address.city }
    client
  end
end
