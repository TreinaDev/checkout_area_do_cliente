require 'rails_helper'

feature 'Client do login' do
  scenario 'and need register your company' do
    client_login

    visit root_path

    expect(page).to have_content('Você ainda não completou a sua conta, para continuar finalize-a.')
    expect(current_path).to eq new_company_path
  end

  scenario 'and need register your company' do
    client_login
    create(:company, client: client_login)

    visit root_path

    expect(current_path).to eq root_path
    expect(page).not_to have_content('Você ainda não completou a sua conta, para continuar finalize-a.')
    expect(current_path).not_to eq new_company_path
  end
end
