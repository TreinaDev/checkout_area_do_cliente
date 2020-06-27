require 'rails_helper'

feature 'Employee approve order' do
  scenario 'successfully like first employee' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    order = create(:order, status: 0)
    login_as employee, scope: :employee
    visit root_path

    click_on 'Pedidos'
    expect(current_path).to eq(order_path)

    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_link('Aprovar Pedido', href: approve_order(order))

    click_on 'Aprovar Pedido'
    expect(current_path).to eq(order_path)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(employee.email)
    expect(page).to have_content('Status: Pré-aprovado')

    expect(page).not_to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Aprovado')
    expect(page).not_to have_content('Status: Rejeitado')
  end

  scenario 'successfully like second employee' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    employee_first = create(:employee,
                            email: 'aprovador@empresa.com', password: '123456')

    order = create(:order, status: 5, first_employee_id: employee_first.id)
    login_as employee, scope: :employee
    visit root_path

    click_on 'Pedidos'
    expect(current_path).to eq(order_path)

    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).to have_content('Email do vendedor que pré-aprovou: ')
    expect(page).to have_link('Aprovar Pedido', href: approve_order(order))

    click_on 'Aprovar Pedido'
    expect(current_path).to eq(order_path)
    expect(page).to have_content(order.plan)
    expect(page).to have_content(employee.email)
    expect(page).to have_content('Status: Aprovado')

    expect(page).not_to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Pré-aprovado')
    expect(page).not_to have_content('Status: Rejeitado')
  end

  scenario 'twice times' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    order = create(:order, status: 5, first_employee_id: employee.id)

    login_as employee, scope: :employee
    visit root_path

    click_on 'Pedidos'
    expect(current_path).to eq(order_path)

    expect(page).to have_content(order.plan)
    expect(page).to have_content(order.status)
    expect(page).not_to have_link('Aprovar Pedido', href: approve_order(order))
    expect(page).to have_content('Status: Pré-aprovado')

    expect(page).not_to have_content('Status: Em aberto')
    expect(page).not_to have_content('Status: Aprovado')
    expect(page).not_to have_content('Status: Rejeitado')
  end
end
