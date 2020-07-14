FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { '123456' }

    trait :with_company do
      after(:create) { |client| create(:company, client: client) }
    end
  end
end
