FactoryBot.define do
  factory :employee do
    email { Faker::Internet.email }
    password { '123456' }
  end
end
