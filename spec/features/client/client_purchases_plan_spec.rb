require 'rails_helper'

feature 'Client purchases a plan' do
  scenario 'sucessfully' do
    client = client_login
    create(:company, client: client)

    visit root_path

    first('a', text: 'Comprar').click

    order = Order.last
    expect(order.client).to eq(client)
    expect(order.plan_id).to eq(1)
    expect(page).to have_content('Compra efetuada com sucesso')
  end

  scenario 'must be logged in' do
    visit root_path

    first('a', text: 'Comprar').click

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
    expect(current_path).to eq(new_client_session_path)
  end
end
