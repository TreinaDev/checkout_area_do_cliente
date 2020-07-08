require 'rails_helper'

feature 'Order to api' do
  scenario 'successfully' do
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    login_as employee, scope: :employee
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples')

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'
  end
end