require 'faker'

#Vendedores
FactoryBot.create(:employee, email: 'first@teste.com')
FactoryBot.create(:employee, email: 'second@teste.com')
FactoryBot.create(:employee, email: 'third@teste.com')

#Pedidos
FactoryBot.create_list(:order_client, 10)

#Pedidos aprovados
FactoryBot.create(:approved_order, order_client: OrderClient.first)
FactoryBot.create(:approved_order, order_client: OrderClient.last)

#Clientes
client_one = Client.create!(email: 'cliente01@email.com', password: '12345678')
client_two = Client.create!(email: 'cliente02@email.com', password: '12345678')

#Empresas
Company.create!(fantasy_name: 'Mc Donalds', corporate_name: 'Arcos Dourados',
                email: 'empresa01@email.com',
                document_number: '11.903578/0001-74',
                address: 'Rua das flores', client: client_two)
