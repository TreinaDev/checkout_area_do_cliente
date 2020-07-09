require 'rails_helper'

feature 'Employee reject orders' do
  scenario 'successfully' do
    employee_login
    order = create(:order_client, plan_id: 1)

    visit order_clients_path
    click_on order.token
    click_on 'Reprovar Pedido'

    expect(current_path).to eq(new_order_client_rejected_order_path(order))
    fill_in 'Motivo', with: 'A empresa não tem infraestrutura.'
    click_on 'Enviar'

    expect(page).to have_content('Pedido rejeitado com sucesso')
    expect(current_path).to eq(order_client_path(order))
    expect(page).to have_content('Rejeitado')
    expect(page).not_to have_content('Aguardando aprovação')
    expect(page).not_to have_content('Aceito')
  end

  scenario 'and other order remains unchanged' do
    employee_login

    order_to_reprove = create(:order_client, plan_id: 1)
    order = create(:order_client, plan_id: 2)

    visit order_clients_path

    click_on order_to_reprove.token
    click_on 'Reprovar Pedido'
    click_on 'Voltar'
    click_on order.token
    expect(page).to have_content('Status: Em aberto')
  end

  scenario 'and rejection must have a reason' do
    employee_login
    order = create(:order_client, plan_id: 1)

    visit order_clients_path
    click_on order.token
    click_on 'Reprovar Pedido'

    expect(current_path).to eq(new_order_client_rejected_order_path(order))
    fill_in 'Motivo', with: ' '
    click_on 'Enviar'

    expect(current_path).to eq(order_client_rejected_orders_path(order))
    expect(page).to have_content('Motivo não pode ficar em branco')
  end
end
