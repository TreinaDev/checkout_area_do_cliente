require 'rails_helper'

feature 'Employee view orders' do
  scenario 'successfully' do
    employee_login
    order = create(:order_client, token: 'FHDBFHDB', plan_id: 1)

    visit plans_path
    click_on 'Pedidos'

    expect(current_path).to eq(order_clients_path)
    expect(page).to have_content(order.token)
<<<<<<< HEAD
    expect(page).to have_content(order.plan(order.plan_id).platform)
    expect(page).to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Aprovado')
=======
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Em aberto')
    expect(page).not_to have_content('Aprovado')
>>>>>>> 38b19cf264792ad0661c30a416e00d3e0674d1f1
  end

  scenario 'and view details' do
    employee_login
    order = create(:order_client, token: 'FHDBFHDB', plan_id: 1)

    visit order_clients_path
    click_on order.token

    expect(page).to have_content(order.token)
<<<<<<< HEAD
    expect(page).to have_content(order.plan(order.plan_id).platform)
    expect(page).to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Aprovado')
=======
    expect(page).to have_content(order.plan)
    expect(page).to have_content('Em aberto')
    expect(page).not_to have_content('Aprovado')
>>>>>>> 38b19cf264792ad0661c30a416e00d3e0674d1f1
    expect(page).to have_link('Aprovar Pedido', href: order_client_approved_orders_path(order.id))
  end

  scenario 'and not view details of other order' do
    employee_login
    order = create(:order_client, plan_id: 1)
    other_order = create(:order_client, plan_id: 2)

    visit order_clients_path

    click_on order.token
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan(order.plan_id).platform)
    expect(page).not_to have_content(other_order.token)
    expect(page).not_to have_content(other_order.plan(other_order.plan_id).platform)
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
