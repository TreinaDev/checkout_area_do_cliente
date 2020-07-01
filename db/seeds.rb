require 'faker'

#Vendedores
first_employee = Employee.create(email: 'first@teste.com', password: '123456')
Employee.create(email: 'second@teste.com', password: '123456')
Employee.create(email: 'third@teste.com', password: '123456')

#Pedidos
10.times do |this|
	OrderClient.create(token: Faker::Code.nric, plan: Faker::Name.name)
end

#Pedidos aprovados
ApprovedOrder.create(order_client_id: OrderClient.first.id)
ApprovedOrder.create(order_client_id: OrderClient.last.id)

#Clientes
client_one = Client.create!(email: 'cliente01@email.com', password: '12345678')
client_two = Client.create!(email: 'cliente02@email.com', password: '12345678')

#Empresas
Company.create!(fantasy_name: 'Mc Donalds', corporate_name: 'Arcos Dourados',
                email: 'empresa01@email.com',
                document_number: '11.903578/0001-74',
                address: 'Rua das flores', client: client_two)

