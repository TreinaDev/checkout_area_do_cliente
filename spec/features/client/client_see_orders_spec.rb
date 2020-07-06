require 'rails_helper'

feature 'client see your orders' do
  scenario 'sucessfully' do
    client1 = create(:client, email: 'teste@teste.com', password: '123456')
    client2 = create(:client, email: 'teste2@teste.com', password: '123456')
    orders_client1 = create_list(:order_client, 5, plan_id: 1, client: client1)
    orders_client2 = create_list(:order_client, 5, plan_id: 2, client: client2)

    login_as client1, scope: :client
    visit root_path
    click_on 'Meus Pedidos'

    expect(page).to have_content(orders_client1[0].plan_id)
    expect(page).to have_content('Em aberto')
    expect(page).to have_content(client1.email)
    expect(page).not_to have_content("Plano: #{orders_client2[0].plan_id}")
    expect(page).not_to have_content(client2.email)
  end

  scenario 'have no orders' do
    client = create(:client, email: 'teste@teste.com', password: '123456')
    client2 = create(:client, email: 'teste2@teste.com', password: '123456')
    orders_client2 = create_list(:order_client, 5, plan_id: 2, client: client2)

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(client_order_clients_path)
    expect(page).not_to have_content(orders_client2[0].plan_id)

    expect(page).to have_content('Você não possui pedidos')
  end
end
