require 'rails_helper'

feature 'Employee login' do
  scenario 'successfully' do
    create(:employee, email: 'vendedor@empresa.com', password: '123456')

    visit root_path
    click_on 'Sou vendedor'
    fill_in 'Email', with: 'vendedor@empresa.com'
    fill_in 'Senha', with: '123456'

    within 'form' do
      click_on 'Entrar como Vendedor'
    end

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Sou vendedor')
  end

  scenario 'and must fill in all fields' do
    visit root_path
    click_on 'Sou vendedor'

    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''

    within 'form' do
      click_on 'Entrar'
    end

    expect(page).to have_content('Email ou senha inválida.')
    expect(page).not_to have_link('Sair')
  end

  scenario 'logs out' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')

    login_as employee, scope: :employee

    visit root_path

    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso.')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
  end

  scenario 'with email wrong' do
    create(:employee, email: 'vendedor@empresa.com', password: '123456')

    visit root_path
    click_on 'Sou vendedor'
    fill_in 'Email', with: 'email@empresa.com'
    fill_in 'Senha', with: '123456'

    within 'form' do
      click_on 'Entrar como Vendedor'
    end

    expect(page).to have_content('Email ou senha inválida.')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
  end

  scenario 'with password wrong' do
    create(:employee, email: 'vendedor@empresa.com', password: '123456')

    visit root_path
    click_on 'Sou vendedor'
    fill_in 'Email', with: 'vendedor@empresa.com'
    fill_in 'Senha', with: '123457'

    within 'form' do
      click_on 'Entrar como Vendedor'
    end

    expect(page).to have_content('Email ou senha inválida.')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
  end
end
