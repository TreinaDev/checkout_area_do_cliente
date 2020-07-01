require 'rails_helper'

feature 'Employee creates a promo' do
  scenario 'successfully' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'

    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto em (%)', with: 30
    fill_in 'Data de Início', with: Time.zone.today
    fill_in 'Data de Término', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Enviar'

    expect(page).to have_content('Promoção cadastrada com sucesso')
    expect(current_path).to eq(promos_path)
  end
  scenario 'Fields cannot be blank' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Desconto em (%) não pode ficar em branco')
    expect(page).to have_content('Data de Início não pode ficar em branco')
    expect(page).to have_content('Data de Término não pode ficar em branco')
    expect(current_path).to eq(promos_path)
  end

  scenario 'Discount cannot be more or equal to 100' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto em (%)', with: 101
    fill_in 'Data de Início', with: Time.zone.today
    fill_in 'Data de Término', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Enviar'

    expect(page).to have_content('Desconto em (%) deve ser menor ou igual a 100')
    expect(current_path).to eq(promos_path)
  end

  scenario 'Start date cannot be in the past' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto em (%)', with: 100
    fill_in 'Data de Início', with: 1.day.ago
    fill_in 'Data de Término', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Enviar'

    expect(page).to have_content('não pode estar no passado')
    expect(current_path).to eq(promos_path)
  end
end
