FactoryBot.define do
  factory :order do
    plan { 'MyString' }
    client
    status { 0 }
  end
end
