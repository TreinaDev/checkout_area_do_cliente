require 'faker'

Employee.create(email: 'first@teste.com', password: '123456')
Employee.create(email: 'second@teste.com', password: '123456')
Employee.create(email: 'third@teste.com', password: '123456')

5.times do |this|
	Order.create(token: Faker::Code.nric, status: 0, plan: Faker::Name.unique.name, 
							 first_employee_id: Faker::Number, second_employee_id: Faker::Number)
end
