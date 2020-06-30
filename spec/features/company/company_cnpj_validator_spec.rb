require 'rails_helper'

feature 'Company CNPJ validator' do
  context 'new' do
    scenario 'numbers invalid' do
      client_login

      visit root_path

      fill_in 'CNPJ', with: '123'
      click_on 'Enviar'

      expect(page).to have_content('CNPJ não é valido')
    end

    scenario 'put letters' do
      client_login
      create(:company, client: client_login)

      visit root_path

      click_on 'Minha conta'
      click_on 'Editar'
      fill_in 'CNPJ', with: 'abc'
      click_on 'Enviar'

      expect(page).to have_content('CNPJ não é valido')
    end
  end

  context 'show' do
    scenario 'numbers invalid' do
      client_login
      create(:company, client: client_login)

      visit root_path

      click_on 'Minha conta'
      click_on 'Editar'

      fill_in 'CNPJ', with: '123'
      click_on 'Enviar'

      expect(page).to have_content('CNPJ não é valido')
    end

    scenario 'put letters' do
      client_login
      create(:company, client: client_login)

      visit root_path

      click_on 'Minha conta'
      click_on 'Editar'

      fill_in 'CNPJ', with: '123'
      click_on 'Enviar'

      expect(page).to have_content('CNPJ não é valido')
    end
  end
end
