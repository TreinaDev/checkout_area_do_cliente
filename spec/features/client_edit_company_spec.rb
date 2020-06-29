require 'rails_helper'

feature 'Client edit company'
  scenario 'successfully' do
    client_login
    company = create(:company, client: client_login)

    visit root_path
    click_on 'Minha conta'
    click_on 'Editar'

    fill_in 'Nome fantasia', with: 'Fantastico'
    fill_in 'Razão social',	with: 'Pilar com luz'
    fill_in 'Email da empresa',	with: 'adm@fantastico.com.br'
    fill_in 'CNPJ',	with: '38.998.846/0001-35'
    fill_in 'Endereço de faturamento', with: 'Rua dos carros N24'
    click_on 'Enviar'

    expect
  end