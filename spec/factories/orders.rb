FactoryBot.define do
  factory :order do
    token { Faker::Code.nric }
    status { 0 }
    plan { Faker::Name.unique.name }
    first_employee_id { Faker::Number }
    second_employee_id { Faker::Number }
  end
end
