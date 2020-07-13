require 'rails_helper'

feature 'client purchases a plan' do
  scenario 'sucessfully' do
    client = client_login
    create(:company, client: client)

    visit root_path

    first('a', text: 'Comprar').click

    order = OrderClient.last
    expect(order.client).to eq(client)
    expect(order.plan_id).to eq(1)
    expect(page).to have_content(order.token)
    expect(page).to have_content(order.plan.name)
    expect(page).to have_content('Compra efetuada com sucesso')
  end

  scenario 'must be logged in' do
    visit root_path

    first('a', text: 'Comprar').click

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
    expect(current_path).to eq(new_client_session_path)
  end

  scenario 'client not have company' do
    client_login

    visit root_path

    expect(page).to have_content('Você ainda não completou a sua conta, para continuar finalize-a.')
  end
end
