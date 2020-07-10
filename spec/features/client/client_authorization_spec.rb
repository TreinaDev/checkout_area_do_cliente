require 'rails_helper'

feature 'Client cannot see promotions' do
  scenario 'in the navigation menu' do
    client_login

    visit root_path

    expect(page).not_to have_content('Promoções')
  end

  scenario 'trying to access the promos route' do
    client_login
    create(:company, client: client_login)

    visit promos_path

    expect(page).to have_content(I18n.t('authorization', scope: %i[company sessions]))
    expect(current_path).to eq root_path
  end

  scenario 'trying to access the new promo route' do
    client_login
    create(:company, client: client_login)

    visit new_promo_path

    expect(page).to have_content(I18n.t('authorization', scope: %i[company sessions]))
    expect(current_path).to eq root_path
  end

  scenario 'but employee can' do
    employee_login
    create(:company, client: client_login)

    visit promos_path

    expect(page).not_to have_content(I18n.t('authorization', scope: %i[company sessions]))
    expect(current_path).to eq promos_path
  end
end
