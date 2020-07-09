require 'rails_helper'

feature 'Client view bots' do
  scenario 'successfully' do
    client_login
    order = create(:order_client, client: client_login)
    create(:approved_order, order_client: order)
    bot_two = create(:approved_order)
    bot_three = create(:approved_order)

    visit root_path
    click_on 'Planos Adquiridos'

    expect(current_path).to eq(approved_orders_path)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).not_to have_content(bot_two.order_client.plan)
    expect(page).not_to have_content(bot_two.order_client.status)
    expect(page).not_to have_content(bot_three.order_client.plan)
    expect(page).not_to have_content(bot_three.order_client.status)
  end

  scenario 'and view bot details' do
    client_login
    Plan.new(id: '1', platform: 'Whatsapp', price: 4000.00, limit_daily: 800,
             limit_monthly: 18_000, cost: 0.80,
             promo: 'Promoção Whatsapp')
    order = create(:order_client, client: client_login, plan_id: '1')
    bot = create(:approved_order, order_client: order)

    visit root_path
    click_on 'Planos Adquiridos'
    click_on order.plan

    expect(current_path).to eq("/approved_order/#{bot.id}")
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.plan.platform)
    expect(page).to have_content(order.plan.limit_daily)
    expect(page).to have_content(order.plan.limit_monthly)
  end

  scenario 'and dont have bots' do
    client_login

    visit root_path
    click_on 'Planos Adquiridos'

    expect(current_path).to eq(approved_orders_path)
    expect(page).to have_content('Você ainda não adquiriu um bot ou seu pedido está mediante à aprovação')
  end
end
