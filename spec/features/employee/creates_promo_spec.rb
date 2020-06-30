require 'rails_helper'

feature 'Employee creates a promo' do
  scenario 'successfully' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto', with: 30
    fill_in 'Data de ínicio', with: date.today
    fill_in 'Data de fim', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Cadastrar'

    expect(page).to have_content('Promoção cadastrada com sucesso')
    expect(current_path).to eq(promo_path)
  end
  scenario 'Title cannot be blank' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: ''
    fill_in 'Desconto', with: 30
    fill_in 'Data de ínicio', with: today
    fill_in 'Data de fim', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Cadastrar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(current_path).to eq(new_promo_path)
  end
  scenario 'Discount cannot be more or equal to 100' do
    employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto', with: 100
    fill_in 'Data de ínicio', with: today
    fill_in 'Data de fim', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Cadastrar'

    expect(page).to have_content()
    expect(current_path).to eq()
  end
  scenario 'Start date cannot be in the past' do
  employee = create(:employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Cadastrar promoção'
    fill_in 'Título', with: 'Promoção da Quarentena'
    fill_in 'Desconto', with: 100
    fill_in 'Data de ínicio', with: 1.day.ago
    fill_in 'Data de fim', with: 7.days.from_now
    fill_in 'Limite de pedidos', with: 100
    click_on 'Cadastrar'

    expect(page).to have_content('Desconto não pode ser maior que 99%')
    expect(current_path).to eq(new_promo_path)
  end
end
