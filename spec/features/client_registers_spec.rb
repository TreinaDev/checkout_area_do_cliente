require 'rails_helper'

feature 'Client registers' do
  scenario 'successfully' do
    client = build(:client)

    visit root_path
    click_on 'Entrar'
    click_on 'Registrar-se'
    fill_in 'Email', with: client.email
    fill_in 'Senha', with: client.password
    fill_in 'Confirmação de senha', with: client.password
    within 'form' do
      click_on 'Registrar-se'
    end

    expect(page).to have_content(I18n.t('signed_up',
                                        scope: %i[devise registration]))
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
    expect(current_path).to eq(root_path)
  end
end
