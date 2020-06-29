require 'faker'

Employee.create(email: 'first@teste.com', password: '123456')
Employee.create(email: 'second@teste.com', password: '123456')
Employee.create(email: 'third@teste.com', password: '123456')

10.times do |this|
	OrderClient.create(token: Faker::Code.nric, plan: Faker::Name.unique.name)
end
