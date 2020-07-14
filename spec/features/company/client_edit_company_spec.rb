require 'rails_helper'

feature 'Client edit company' do
  scenario 'successfully' do
    client_login
    create(:company, client: client_login)

    visit root_path
    click_on 'Minha conta'
    click_on 'Editar'

    fill_in 'Nome fantasia', with: 'Fantastico'
    fill_in 'Razão social',	with: 'Pilar com luz'
    fill_in 'Email da empresa',	with: 'adm@fantastico.com.br'
    fill_in 'CNPJ',	with: '38.998.846/0001-35'
    fill_in 'Endereço de faturamento', with: 'Rua dos carros N24'
    click_on 'Enviar'

    expect(page).to have_content('Fantastico')
    expect(page).to have_content('Pilar com luz')
    expect(page).to have_content('adm@fantastico.com.br')
    expect(page).to have_content('38.998.846/0001-35')
    expect(page).to have_content('Rua dos carros N24')
    expect(page).to have_content('Empresa editada com sucesso')
  end

  scenario 'and each field cannot be blank' do
    client_login
    create(:company, client: client_login)

    visit root_path
    click_on 'Minha conta'
    click_on 'Editar'

    fill_in 'Nome fantasia', with: ''
    fill_in 'Razão social',	with: ''
    fill_in 'Email da empresa',	with: ''
    fill_in 'CNPJ',	with: ''
    fill_in 'Endereço de faturamento', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome fantasia não pode ficar em branco')
    expect(page).to have_content('Razão social não pode ficar em branco')
    expect(page).to have_content('Email da empresa não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço de faturamento não pode ficar em branco')
  end

  scenario 'and fields must be unique' do
    client_login
    create(:company, client: client_login)
    company = create(:company)

    visit root_path
    click_on 'Minha conta'
    click_on 'Editar'

    fill_in 'Nome fantasia', with: company.fantasy_name
    fill_in 'Razão social',	with: company.corporate_name
    fill_in 'Email da empresa', with: company.email
    fill_in 'CNPJ',	with: company.cnpj
    fill_in 'Endereço de faturamento', with: company.address
    click_on 'Enviar'

    expect(page).to have_content('Nome fantasia já está em uso')
    expect(page).to have_content('Razão social já está em uso')
    expect(page).to have_content('Email da empresa já está em uso')
    expect(page).to have_content('CNPJ já está em uso')
  end
end
