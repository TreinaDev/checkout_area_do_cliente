require 'rails_helper'

feature 'Client view bots' do
  scenario 'successfully' do
    order = create(:order_client, client: client_login)
    create(:approved_order, order_client: order)
    order.accepted!
    bot_two = create(:approved_order)
    bot_three = create(:approved_order)

    visit root_path
    click_on 'Planos Adquiridos'

    expect(current_path).to eq(approved_orders_path)
    expect(page).to have_content(order.plan)
    expect(page).to have_link('Cancelar Bot')
    expect(page).not_to have_link('Processo de Cancelamento')
    expect(page).not_to have_content(bot_two.order_client.plan)
    expect(page).not_to have_content(bot_two.order_client.status)
    expect(page).not_to have_content(bot_three.order_client.plan)
    expect(page).not_to have_content(bot_three.order_client.status)
  end

  scenario 'and view bot details' do
    Plan.new(id: 1, name: 'totam', created_at: '2020-07-07T09:36:39.688-03:00',
             updated_at: '2020-07-07T09:36:39.688-03:00', platforms: 'Whatsapp',
             limit_daily_chat: 1, limit_monthly_chat: 1, limit_daily_messages: 1,
             limit_monthly_messages: 1, extra_message_price: 1.5, extra_chat_price: 1.5,
             current_price: 67.27)

    order = create(:order_client, client: client_login, plan_id: '1')
    order.accepted!
    bot = create(:approved_order, order_client: order)

    visit root_path
    click_on 'Planos Adquiridos'
    expect(current_path).to eq(approved_orders_path)
    first('a', text: order.plan).click

    expect(current_path).to eq("/approved_order/#{bot.id}")
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.plan.platforms)
    expect(page).to have_content(order.plan.limit_daily_messages)
    expect(page).to have_content(order.plan.limit_monthly_messages)
  end

  scenario 'and dont have bots' do
    client_login

    visit root_path
    click_on 'Planos Adquiridos'

    expect(current_path).to eq(approved_orders_path)
    expect(page).to have_content('Você ainda não adquiriu um bot ou seu pedido está mediante à aprovação')
  end
end
