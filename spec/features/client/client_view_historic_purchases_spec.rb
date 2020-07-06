require 'rails_helper'

feature 'Client view historic purchases' do
  scenario 'successfully' do
    client = create(:client)
    other_client = create(:client)
    create(:company, client: client)
    create(:company, client: other_client)

    login_as other_client, scope: :client
    visit root_path
    within('div#plan-1') do
      first(:link, 'Comprar').click
    end
    logout(:client)

    login_as client, scope: :client
    visit root_path
    within('div#plan-2') do
      first(:link, 'Comprar').click
    end
    visit root_path
    click_on 'Minha conta'
    click_on 'Compras'

    orders = Order.all
    expect(current_path).to eq orders_companies_path
    expect(page).not_to have_content(orders.first.plan_id)
    expect(page).to have_content(orders.last.plan_id)
    expect(orders.last.client).to eq(client)
  end

  scenario 'end client cannot see link' do
    client = client_login
    other_client = create(:client)
    create(:company, client: client)
    create(:company, client: other_client)

    visit company_path(other_client)

    expect(page).not_to have_link('Compras', href: orders_companies_path)
  end

  scenario 'end client cannot be on route' do
    client_login

    visit orders_companies_path

    expect(page).to have_content(I18n.t('check_company', scope: %i[company sessions]))
  end
end
