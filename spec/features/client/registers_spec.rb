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

<<<<<<< HEAD
    expect(page).to have_content(I18n.t('signed_up',
                                        scope: %i[devise registrations]))
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
    expect(current_path).to eq(root_path)
=======
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
    expect(current_path).to eq(new_company_path)
>>>>>>> 409d9f6a9de2db6d5af2d261bdc2b2c295c7347c
  end

  scenario 'and fields cannot be blank' do
    visit root_path
    click_on 'Entrar'
    click_on 'Registrar-se'
    within 'form' do
      click_on 'Registrar-se'
    end

    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
    expect(current_path).not_to eq(root_path)
  end

  scenario 'and email must be uniq' do
    client = build(:client)
    client.save

    visit root_path
    click_on 'Entrar'
    click_on 'Registrar-se'
    fill_in 'Email', with: client.email
    fill_in 'Senha', with: client.password
    fill_in 'Confirmação de senha', with: client.password
    within 'form' do
      click_on 'Registrar-se'
    end

    expect(page).to have_content('Email já está em uso')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
    expect(current_path).not_to eq(root_path)
  end
end
