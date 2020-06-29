require 'faker'

first_employee = Employee.create(email: 'first@teste.com', password: '123456')
Employee.create(email: 'second@teste.com', password: '123456')
Employee.create(email: 'third@teste.com', password: '123456')

10.times do |this|
	OrderClient.create(token: Faker::Code.nric, plan: Faker::Name.name)
end

Aproved.create(order_client_id: OrderClient.first.id,
							 employee_id: first_employee.id)
Aproved.create(order_client_id: OrderClient.last.id,
							 employee_id: first_employee.id)
