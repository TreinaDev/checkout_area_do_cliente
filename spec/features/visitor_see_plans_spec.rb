require 'rails_helper'

feature 'Visitor see plans in home page' do
  scenario 'successfully' do
    plan = Plan.new(platform: 'Whatsapp', price: 4000.00, limit_daily: 800,
                    limit_monthly: 18_000, cost: 0.80,
                    promo: 'Promoção Whatsapp')
    plan2 = Plan.new(platform: 'Facebook', price: 3000.00, limit_daily: 400,
                     limit_monthly: 10_000, cost: 0.50,
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

  scenario 'by have not any plan register' do
    allow(Plan).to receive(:all).and_return([])
    visit root_path
    expect(page).to have_content('Sem planos cadastrados')
  end

  scenario 'and cannot visit history unless be logged' do
    visit plans_path

    expect(current_path).to eq(new_client_session_path)
  end

  scenario 'and cannot view history unless be logged' do
    visit root_path

    expect(page).not_to have_link('Histórico de pedidos')
  end
end
