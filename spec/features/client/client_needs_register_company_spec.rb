require 'rails_helper'

feature 'Client do login' do
  scenario 'and need register your company' do
    client_login

    visit root_path

    expect(page).to have_content(I18n.t('check_company', scope: %i[company sessions]))
    expect(current_path).to eq new_company_path
  end

  scenario 'and registered your company' do
    client_login
    create(:company, client: client_login)

    visit root_path

    expect(current_path).to eq root_path
    expect(page).not_to have_content(I18n.t('check_company', scope: %i[company sessions]))
    expect(current_path).not_to eq new_company_path
  end

  scenario 'end visit try see company' do
    visit new_company_path

    expect(current_path).to eq new_client_session_path
    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end
end
