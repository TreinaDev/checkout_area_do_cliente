require 'faker'

# Vendedores - Senhas geradas automaticamente pela factory
FactoryBot.create(:employee, email: 'first@teste.com')
FactoryBot.create(:employee, email: 'second@teste.com')
FactoryBot.create(:employee, email: 'third@teste.com')

# Clientes - Senhas geradas automaticamente pela factory
FactoryBot.create(:client, email: 'cliente01@email.com')
FactoryBot.create(:client, email: 'cliente02@email.com')

# Pedidos
FactoryBot.create_list(:order_client, 5, plan_id: 1, client: Client.first)
FactoryBot.create_list(:order_client, 5, plan_id: 2, client: Client.last)

# Pedidos aprovados
FactoryBot.create(:approved_order, order_client: OrderClient.first)
FactoryBot.create(:approved_order, order_client: OrderClient.last)

# Empresas
FactoryBot.create(:company, fantasy_name: 'Mc Donalds',
                            corporate_name: 'Arcos Dourados',
                            email: 'empresa01@email.com',
                            document_number: '11.903578/0001-74',
                            address: 'Rua das flores',
                            client: Client.first)

# Promo
FactoryBot.create(:promo, title: 'Promoção em aberto', discount: 0,
                          start_date: Time.zone.today, end_date: 7.days.from_now,
                          status: 0, limit_order: 0, employee: Employee.first)
FactoryBot.create(:promo, title: 'Promoção aprovada', discount: 100,
                          start_date: Time.zone.today, end_date: 7.days.from_now,
                          status: 5, limit_order: 1000, employee: Employee.first)
