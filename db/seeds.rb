require 'faker'

#Vendedores
first_employee = Employee.create(email: 'first@teste.com', password: '123456')
Employee.create(email: 'second@teste.com', password: '123456')
Employee.create(email: 'third@teste.com', password: '123456')

#Clientes
client_one = Client.create!(email: 'cliente01@email.com', password: '12345678')
client_two = Client.create!(email: 'cliente02@email.com', password: '12345678')

#Pedidos
5.times do |this|
  OrderClient.create(token: Faker::Code.nric, plan: Faker::Name.name, 
                    client: client_one)
end
5.times do |this|
  OrderClient.create(token: Faker::Code.nric, plan: Faker::Name.name, 
                    client: client_two)
end
#Pedidos aprovados
ApprovedOrder.create(order_client_id: OrderClient.first.id)
ApprovedOrder.create(order_client_id: OrderClient.last.id)


#Empresas
Company.create!(fantasy_name: 'Mc Donalds', corporate_name: 'Arcos Dourados',
                email: 'empresa01@email.com',
                document_number: '11.903578/0001-74',
                address: 'Rua das flores', client: client_two)

#Promo
Promo.create!(title: 'Promoção em aberto',discount:0,start_date: Time.zone.today,
              end_date: 7.days.from_now,status: 0,limit_order: 0,
              employee: first_employee)
Promo.create!(title: 'Promoção aprovada',discount:100,start_date: Time.zone.today,
              end_date: 7.days.from_now,status: 5,limit_order: 1000,
              employee: first_employee)

