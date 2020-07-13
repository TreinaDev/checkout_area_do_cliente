require 'rails_helper'

feature 'client see your orders' do
  scenario 'sucessfully' do
    client1 = client_login
    client2 = create(:client, email: 'teste2@teste.com', password: '123456')
    orders_client1 = create_list(:order_client, 5, plan_id: 1, client: client1)
    orders_client2 = create_list(:order_client, 5, plan_id: 2, client: client2)

    visit root_path
    click_on 'Meus Pedidos'

    expect(page).to have_content(orders_client1[0].token)
    expect(page).to have_content('Em aberto')
    expect(page).to have_content(client1.email)
    expect(page).not_to have_content(orders_client2[0].token)
    expect(page).not_to have_content(client2.email)
  end

  scenario 'have no orders' do
    client_login
    client2 = create(:client, email: 'teste2@teste.com', password: '123456')
    orders_client2 = create_list(:order_client, 5, plan_id: 2, client: client2)

    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(client_order_clients_path)
    expect(page).not_to have_content(orders_client2[0].plan_id)

    expect(page).to have_content('Você não possui pedidos')
  end

  scenario 'but cannot see of other clients' do
    client1 = client_login
    create(:company, client: client_login)
    create(:order_client, plan_id: 1, client: client1)
    order_client2 = create(:order_client)

    visit order_client_path(order_client2.id)

    expect(page).to have_content(I18n.t('authorization', scope: %i[company sessions]))
    expect(current_path).to eq root_path
  end

  scenario 'but cannot see all orders from all clients' do
    client1 = client_login
    create(:company, client: client_login)
    create_list(:order_client, 2, plan_id: 1, client: client1)
    create_list(:order_client, 2)

    visit order_clients_path

    expect(page).to have_content(I18n.t('authorization', scope: %i[company sessions]))
    expect(current_path).to eq root_path
  end
end
