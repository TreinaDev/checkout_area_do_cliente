require 'rails_helper'

feature 'Client cancel bots' do
  scenario 'successfully' do
    order = create(:order_client, client: client_login)
    create(:approved_order, order_client: order)
    order.accepted!

    visit approved_orders_path
    expect(page).to have_content(order.plan)

    click_on 'Cancelar Bot'
    fill_in 'Motivo', with: 'Este bot não atende mais as necessidades da minha empresa'
    click_on 'Enviar'

    expect(page).to have_content('Pedido de cancelamento enviado com sucesso')
  end
  scenario 'and see detals of cancellation' do
    order = create(:order_client, client: client_login)
    order.accepted!
    approved_order = create(:approved_order, order_client: order)
    cancel_bot_client = create(:cancel_bot_client, approved_order: approved_order, reason: 'Não preciso mais do bot')
    cancel_bot_client.waiting!

    visit approved_orders_path
    expect(current_path).to eq(approved_orders_path)

    expect(page).to have_content(order.plan)
    expect(page).not_to have_link('Cancelar Bot')
    expect(page).to have_link('Processo de Cancelamento')

    click_on 'Processo de Cancelamento'
    expect(page).to have_content(cancel_bot_client.reason)
    expect(page).to have_content('Status: Em processamento')
  end
  scenario 'and reason can not be blank' do
    order = create(:order_client, client: client_login)
    create(:approved_order, order_client: order)
    order.accepted!

    visit approved_orders_path
    expect(page).to have_content(order.plan)

    click_on 'Cancelar Bot'
    fill_in 'Motivo', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Motivo não pode ficar em branco')
  end
end
