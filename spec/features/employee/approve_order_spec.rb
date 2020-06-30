require 'rails_helper'

feature 'Employee approve order' do
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
    expect(page).to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Aprovado')
    expect(page).to have_link('Aprovar Pedido', href: order_clients_path)

    click_on 'Aprovar Pedido'
    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content('Status: Aprovado')
    expect(page).not_to have_content('Status: Em aberto')
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
