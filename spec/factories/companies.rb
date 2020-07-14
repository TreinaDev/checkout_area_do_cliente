FactoryBot.define do
  factory :company do
    fantasy_name { Faker::Company.name }
    corporate_name { Faker::Company.name }
    email { Faker::Internet.email }
    cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    address { Faker::Address.city }
    client
  end
end
