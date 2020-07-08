require 'faker'

# Vendedores
FactoryBot.create(:employee, email: 'first@teste.com')
FactoryBot.create(:employee, email: 'second@teste.com')
FactoryBot.create(:employee, email: 'third@teste.com')

# Pedidos
FactoryBot.create_list(:order_client, 10)

# Pedidos aprovados
FactoryBot.create(:approved_order, order_client: OrderClient.first)
FactoryBot.create(:approved_order, order_client: OrderClient.last)

# Clientes
FactoryBot.create(:client, email: 'cliente01@email.com')
FactoryBot.create(:client, email: 'cliente02@email.com')

# Empresas
FactoryBot.create(:company, fantasy_name: 'Mc Donalds',
                            corporate_name: 'Arcos Dourados',
                            email: 'empresa01@email.com',
                            document_number: '11.903578/0001-74',
                            address: 'Rua das flores', client: Client.last)
