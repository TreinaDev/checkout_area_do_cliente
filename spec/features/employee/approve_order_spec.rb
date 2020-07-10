require 'rails_helper'

feature 'Employee view orders' do
  scenario 'successfully' do
    employee_login
    order = create(:order_client, plan_id: 1, status: 0)

    visit plans_path
    click_on 'Pedidos'

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan(order.plan_id).name)
    expect(page).to have_content('Em aberto')
    expect(page).not_to have_content('Aprovado')
  end

  scenario 'and view details' do
    employee_login
    order = create(:order_client, plan_id: 1, status: 0)

    visit order_clients_path
    click_on order.token

    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan(order.plan_id).name)
    expect(page).to have_content('Em aberto')
    expect(page).not_to have_content('Aprovado')
    expect(page).to have_link('Aprovar Pedido', href: order_client_approved_orders_path(order.id))
  end

  scenario 'and not view details of other order' do
    employee_login
    order = create(:order_client, plan_id: 1)
    other_order = create(:order_client, plan_id: 2)

    visit order_clients_path

    click_on order.token
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan(order.plan_id).name)
    expect(page).not_to have_content(other_order.token)
    expect(page).not_to have_content(other_order.plan(other_order.plan_id).name)
  end

  scenario 'and approve order' do
    employee_login
    order = create(:order_client, token: 'FHDBFHDB', plan_id: 1)

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    expect(current_path).to eq("/order_clients/#{order.id}")
    expect(page).to have_content('Aprovado')
    expect(page).not_to have_content('Aguardando aprovação')
    expect(page).not_to have_content('Rejeitado')
  end

  scenario 'and other order remains unchanged' do
    employee_login

    order_to_approve = create(:order_client, plan_id: 1)
    order = create(:order_client, plan_id: 2)

    visit order_clients_path

    click_on order_to_approve.token
    click_on 'Aprovar Pedido'
    click_on 'Voltar'
    click_on order.token
    expect(page).to have_content('Status: Em aberto')
  end
  scenario 'but no have any order' do
    employee_login
    visit order_clients_path

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content('Nenhum pedido cadastrado')
  end
end
