require 'rails_helper'

feature 'Visitor see plans in home page' do
  scenario 'successfully' do
    plan = Plan.new(platform: 'Facebook',
                    price: 3000.00,
                    limit_daily: 400,
                    limit_monthly: 10_000,
                    cost: 0.50,
                    promo: 'Promoção Facebook')

    plan2 = Plan.new(platform: 'Facebook',
                     price: 3000.00,
                     limit_daily: 400,
                     limit_monthly: 10_000,
                     cost: 0.50,
                     promo: 'Promoção Facebook')

    visit root_path

    expect(page).to have_content(plan.platform)
    expect(page).to have_content(plan.price)
    expect(page).to have_content(plan.limit_monthly)
    expect(page).to have_content(plan.limit_daily)
    expect(page).to have_content(plan.cost)
    expect(page).to have_content(plan.promo)

    expect(page).to have_content(plan2.platform)
    expect(page).to have_content(plan2.price)
    expect(page).to have_content(plan2.limit_monthly)
    expect(page).to have_content(plan2.limit_daily)
    expect(page).to have_content(plan2.cost)
    expect(page).to have_content(plan2.promo)
  end

  scenario 'Visitor cannot visit history unless be logged' do
    visit plans_path

    expect(current_path).to eq(new_client_session_path)
  end

  scenario 'Visitor cannot view history unless be logged' do
    visit root_path

    expect(page).not_to have_link('HIstórico de pedidos')
  end
end
