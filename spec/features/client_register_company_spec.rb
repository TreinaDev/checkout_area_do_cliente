require 'rails_helper'

feature 'Client register company' do
  scenario 'successfully' do
    client_login

    visit root_path

    fill_in 'Nome fantasia', with: 'Fantastico'
    fill_in 'Razão social',	with: 'Pilar com luz'
    fill_in 'Email da empresa',	with: 'adm@fantastico.com.br'
    fill_in 'CNPJ',	with: '38.998.846/0001-35'
    fill_in 'Endereço de faturamento', with: 'Rua dos carros N24'
    click_on 'Enviar'

    expect(page).to have_content('Nome fantasia: Fantastico')
    expect(page).to have_content('Razão social: Pilar com luz')
    expect(page).to have_content('Email da empresa: adm@fantastico.com.br')
    expect(page).to have_content('CNPJ: 38.998.846/0001-35')
    expect(page).to have_content('Endereço de faturamento: Rua dos carros N24')
  end

  scenario 'and each field cannot be blank' do
    client_login

    visit root_path
    click_on 'Enviar'

    expect(page).to have_content('Nome fantasia não pode ficar em branco')
    expect(page).to have_content('Razão social não pode ficar em branco')
    expect(page).to have_content('Email da empresa não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço de faturamento não pode ficar em branco')
  end

  scenario 'and fields must be unique' do
    client_login
    company = create(:company)

    visit root_path
    fill_in 'Nome fantasia', with: company.fantasy_name
    fill_in 'Razão social',	with: company.corporate_name
    fill_in 'Email da empresa', with: company.email
    fill_in 'CNPJ',	with: company.document_number
    fill_in 'Endereço de faturamento', with: company.address
    click_on 'Enviar'

    expect(page).to have_content('Nome fantasia já está em uso')
    expect(page).to have_content('Razão social já está em uso')
    expect(page).to have_content('Email da empresa já está em uso')
    expect(page).to have_content('CNPJ já está em uso')
  end

  scenario 'end must be signed in' do
    visit new_company_path

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end
end
