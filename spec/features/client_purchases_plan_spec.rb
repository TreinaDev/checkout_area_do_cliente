require 'rails_helper'

feature 'Client purchases a plan' do
  scenario 'sucessfully' do
    client = create(:client)

    login_as client, scope: :client
    visit root_path

    all('a', text: 'Comprar')[0].click

    order = Order.last
    expect(order.client).to eq(client)
    expect(order.plan).to eq('1')
    expect(page).to have_content('Compra efetuada com sucesso')
  end

  scenario 'must be logged in' do
    visit root_path

    first('a', text:'Comprar').click

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
    expect(current_path).to eq(new_client_session_path)
  end
end
