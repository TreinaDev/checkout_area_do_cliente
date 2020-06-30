require 'rails_helper'

feature 'Employee view orders' do
  before(:each) do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    visit plans_path
  end

  scenario 'successfully' do
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    click_on 'Pedidos'

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Aprovado')
  end

  scenario 'and view details' do
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    click_on 'Pedidos'
    click_on order.token

    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Aprovado')
    expect(page).to have_link('Aprovar Pedido', href: order_client_approved_orders_path(order.id))
  end

  scenario 'and approve order' do
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    click_on 'Pedidos'
    click_on order.token
    click_on 'Aprovar Pedido'

    expect(current_path).to eq("/order_clients/#{order.id}")
    expect(page).to have_content('Status: Aprovado')
    expect(page).not_to have_content('Status: Aguardando aprovação')
    expect(page).not_to have_content('Status: Rejeitado')
  end

  scenario 'and other order remains unchanged' do
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')
    other_order = create(:order_client, token: 'AAAAAA', plan: 'Extraordinário')
    click_on 'Pedidos'
    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(other_order.token)
    expect(page).to have_content(other_order.plan)

    find("link_to_aproved_#{order.id}").click

    # expect(order).to have_content(other_order.plan)
    # expect(page).to have_content(other_order.plan)
  end
  scenario 'but no have any order' do
    click_on 'Pedidos'
    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content('Nenhum pedido cadastrado')
  end
end
