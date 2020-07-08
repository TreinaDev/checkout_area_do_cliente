require 'rails_helper'

feature 'client cancel an open order' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')
    order = create(:order_client, plan_id: 1, client: client)
    order2 = create(:order_client, plan_id: 2, client: client)

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(client_order_clients_path)

    expect(page).to have_content(order.plan_id)
    expect(page).to have_content('Em aberto')
    expect(page).to have_content(order2.plan_id)
    expect(page).to have_content('Em aberto')

    expect(page).to have_link('Cancelar Pedido')
    find("a#cancel-#{order.id}").click

    expect(current_path).to eq(client_order_clients_path)
    expect(page).to have_content('Cancelado')
    expect(page).not_to have_css("#cancel-#{order.id}")
    expect(page).to have_css("#cancel-#{order2.id}")
  end
end

feature 'client cannot cancel order approved/canceled/rejected' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')
    order = create(:order_client, plan_id: 1, client: client, status: 5)
    order2 = create(:order_client, plan_id: 2, client: client, status: 10)
    order3 = create(:order_client, plan_id: 2, client: client, status: 15)

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(client_order_clients_path)

    expect(page).to have_content(order.plan_id)
    expect(page).to have_content('Aprovado')
    expect(page).to have_content(order2.plan_id)
    expect(page).to have_content('Rejeitado')
    expect(page).to have_content(order3.plan_id)
    expect(page).to have_content('Cancelado')

    expect(page).not_to have_link('Cancelar Pedido')
  end
end
