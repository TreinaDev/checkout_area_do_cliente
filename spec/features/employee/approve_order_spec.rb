require 'rails_helper'

feature 'Employee view orders' do
  scenario 'successfully' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    visit plans_path
    click_on 'Pedidos'

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Aprovado')
  end

  scenario 'and view details' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    visit order_clients_path
    click_on order.token

    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Aprovado')
    expect(page).to have_link('Aprovar Pedido', href: order_client_approved_orders_path(order.id))
  end
  scenario 'and not view details of other order' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')
    other_order = create(:order_client, token: 'AAAAAA', plan: 'Extraordinário')

    visit order_clients_path

    click_on 'FHDBFHDB'
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).not_to have_content(other_order.token)
    expect(page).not_to have_content(other_order.plan)
  end

  scenario 'and approve order' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    expect(current_path).to eq("/order_clients/#{order.id}")
    expect(page).to have_content('Status: Aprovado')
    expect(page).not_to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Rejeitado')
  end

  scenario 'and other order remains unchanged' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee

    create(:order_client, token: 'FHDBFHDB', plan: 'Simples')
    create(:order_client, token: 'AAAAAA', plan: 'Extraordinário')

    visit order_clients_path

    click_on 'FHDBFHDB'
    click_on 'Aprovar Pedido'
    click_on 'Voltar'
    click_on 'AAAAAA'
    expect(page).to have_content('Status: Aguardando aprovação')
  end
  scenario 'but no have any order' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    visit order_clients_path

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content('Nenhum pedido cadastrado')
  end
end
