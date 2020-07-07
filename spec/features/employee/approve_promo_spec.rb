require 'rails_helper'

feature 'Employee aproves a promo' do
  #Vendedor aprova a promoção criada por outro vendedor
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
    expect(page).to have_content(promo.status)
    expect(page).to have_content(promo.employee.email)

    find("a#approve-#{promo.id}").click
    expect(current_path).to eq(promos_path)
    expect(page).to have_content('Aprovado')
    expect(page).to have_content('Promoção aprovada com sucesso')
    expect(page).not_to have_content('Aguardando aprovação.')
  end
  #Vendedor não consegue aprovar a própria promoção
  scenario 'created by himself' do
    employee = create(:employee)
    promo = create(:promo, employee: employee)
    login_as employee, scope: :employee
    visit root_path

    click_on 'Promoções'
    expect(current_path).to eq(promos_path)
    expect(page).not_to have_content("a#approve-#{promo.id}")
  end

  #Vendedor tenta aprovar duas vezes
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
  #Vendedor não tem promoção para aprovar
  #Vendedor não consegue aprovar promo fora do período da promo
  scenario 'have any promo to approve' do
    employee = create(:employee)
    promo = create(:promo, status:5)
    promo_out_dated = create(:promo, end_date: Time.zone.yesterday)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Promoções'

    expect(page).to have_content(promo.title)
    expect(page).to have_content(promo.discount)
    expect(page).to have_content(promo.start_date)
    expect(page).to have_content(promo.end_date)
    expect(page).to have_content(promo.limit_order)
    expect(page).to have_content(promo.status)
    expect(page).to have_content(promo_out_dated.title)
    expect(page).to have_content(promo_out_dated.discount)
    expect(page).to have_content(promo_out_dated.start_date)
    expect(page).to have_content(promo_out_dated.end_date)
    expect(page).to have_content(promo_out_dated.limit_order)
    expect(page).to have_content(promo_out_dated.status)
    expect(page).not_to have_content("a#approve-#{promo.id}")
    expect(page).not_to have_content("a#approve-#{promo_out_dated.id}")
  end
  #Vendedor não tem promoção cadastrada
  scenario 'have any promo' do
    employee = create(:employee)
    login_as employee, scope: :employee

    expect(page).to have_content('Nenhuma promoção cadastrada')
  end
end
