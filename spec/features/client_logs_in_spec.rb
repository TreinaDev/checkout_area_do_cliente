require 'rails_helper'

feature 'Client logs in' do
  scenario 'sucessfully' do
    client = create(:client, email: 'teste@teste.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: '123456'
    click_button 'Entrar'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
  end
  scenario 'logs out' do 
    client = create(:client, email: 'teste@teste.com', password: '123456')

    login_as client, scope: :client

    visit root_path

    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso.')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
  end

end
