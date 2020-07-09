require 'rails_helper'

feature 'Employee aproves a promo' do
  scenario 'successfully' do
    employee = create(:employee)
    promo = create(:promo, employee: employee)
    login_as employee, scope: :employee
    visit root_path

    click_on 'Promoções'
    expect(current_path).to eq(promos_path)

    expect(page).to have_content(promo.title)
    expect(page).to have_content(promo.discount)
    expect(page).to have_content(promo.start_date)
    expect(page).to have_content(promo.end_date)
    expect(page).to have_content(promo.limit_order)
    expect(page).to have_content('Em aberto')
    expect(page).to have_content(promo.employee.email)

    find("a#approve-#{promo.id}").click
    expect(current_path).to eq(promos_path)
    expect(page).to have_content('Aprovado')
    expect(page).to have_content('Promoção aprovada com sucesso')
    expect(page).not_to have_content('Aguardando aprovação.')
  end

  scenario 'created by himself' do
    employee = create(:employee)
    promo = create(:promo, employee: employee)
    login_as employee, scope: :employee
    visit root_path

    click_on 'Promoções'
    expect(current_path).to eq(promos_path)
    expect(page).not_to have_content("a#approve-#{promo.id}")
  end

  scenario 'twice times' do
    employee = create(:employee)
    promo = create(:promo, employee: employee)
    login_as employee, scope: :employee

    visit root_path
    click_on 'Promoções'

    find("a#approve-#{promo.id}").click
    expect(current_path).to eq(promos_path)
    expect(page).to have_content('Aprovado')
    expect(page).to have_content('Promoção aprovada com sucesso')
    expect(page).not_to have_content('Aguardando aprovação.')
    expect(page).not_to have_content("a#approve-#{promo.id}")
  end

  scenario 'have any promo to approve' do
    employee = create(:employee)
    promo = create(:promo, status: 5)
    promo_out_dated = create(:promo)
    promo_out_dated.end_date = Time.zone.yesterday

    login_as employee, scope: :employee
    visit root_path
    click_on 'Promoções'

    expect(page).to have_content(promo.title)
    expect(page).to have_content(promo.discount)
    expect(page).to have_content(promo.start_date)
    expect(page).to have_content(promo.end_date)
    expect(page).to have_content(promo.limit_order)
    expect(page).to have_content('Aprovado')
    expect(page).to have_content(promo_out_dated.title)
    expect(page).to have_content(promo_out_dated.discount)
    expect(page).to have_content(promo_out_dated.start_date)
    expect(page).to have_content(promo_out_dated.limit_order)
    expect(page).to have_content('Em aberto')
    expect(page).not_to have_content("a#approve-#{promo.id}")
    expect(page).not_to have_content("a#approve-#{promo_out_dated.id}")
  end

  scenario 'when have any promo' do
    employee = create(:employee)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Promoções'

    expect(page).to have_content('Nenhuma promoção cadastrada')
  end
end
