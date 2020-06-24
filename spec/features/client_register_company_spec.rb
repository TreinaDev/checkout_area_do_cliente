require 'rails_helper'

feature 'Client register company' do
  scenario 'successfully' do
    client_login

    visit root_path

    fill_in 'Nome fantasia',	with: 'Fantastico'
    fill_in 'Razão social',	with: 'Pilar com luz'
    fill_in 'Email da empresa',	with: 'adm@fantastico.com.br'
    fill_in 'CNPJ',	with: '38.998.846/0001-35'
    fill_in 'Endereço do faturamento',	with: 'Rua dos carros N24'
    click_on 'Enviar'

    expect(page).to have_content('Nome: fantasia: Fantastico')
    expect(page).to have_content('Razão social: Pilar com luz')
    expect(page).to have_content('Email da empresa: adm@fantastico.com.br')
    expect(page).to have_content('CNPJ: 38.998.846/0001-35')
    expect(page).to have_content('Endereço do faturamento: Rua dos carros N24')
  end
end
