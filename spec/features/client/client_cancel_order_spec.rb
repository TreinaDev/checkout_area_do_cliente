require 'rails_helper'

feature 'client cancel an open order' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')
    order = create(:order, plan: 'Whatsapp', client: client)
    order2 = create(:order, plan: 'Facebook', client: client)

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(orders_path)

    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order2.plan)
    expect(page).to have_content(order2.status)

    expect(page).to have_link('Cancelar pedido')
    find("a#cancel-#{order.id}").click()

    expect(current_path).to eq(orders_path)
    expect(page).to have_content('Cancelado')
    expect(page).to have_link(find("a#cancel-#{order.id}"))
  end
end

feature 'client cannot cancel order approved/canceled/rejected' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')
    order = create(:order, plan: 'Whatsapp', client: client, status: 5)
    order2 = create(:order, plan: 'Facebook', client: client, status: 10)
    order3 = create(:order, plan: 'Facebook', client: client, status: 15)

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(orders_path)

    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order2.plan)
    expect(page).to have_content(order2.status)
    expect(page).to have_content(order3.plan)
    expect(page).to have_content(order3.status)

    expect(page).not_to have_link('Cancelar pedido')
  end
end

feature 'client see orders' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')

    login_as client, scope: :client
    visit root_path

    click_on 'Meus Pedidos'
    expect(current_path).to eq(orders_path)

    expect(page).to have_content('Você não possui pedidos em aberto')
  end
end