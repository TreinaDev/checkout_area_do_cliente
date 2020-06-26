require 'rails_helper'

feature 'Client do login' do
  scenario 'and need register your company' do
    client = build(:client)

    visit root_path

    expect(page).to have_content('Você ainda não completou a sua conta, para continuar finalize-a.')
    expect(current_path).to eq new_company_path
  end

  scenario 'and need register your company' do
    client = build(:client)

    visit root_path

    expect(page).to have_content('Você ainda não completou a sua conta, para continuar finalize-a.')
    expect(current_path).to eq new_company_path
  end
end
