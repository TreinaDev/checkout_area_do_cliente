require 'rails_helper'

feature 'Order to api' do
  scenario 'successfully' do
    client = client_login
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com',
                      password: '123456')
    order = OrderClient.create!(token: 'ASDSAFdfsdfd', plan: 'Simples',
                               plan_id: 1, client: client)

    url = 'http://localhost:3000/api/v1/purchases'
    json = { company_token: order.token, plan_id: order.plan_id }
    response_json = { company: { name: company.fantasy_name },
                      plan: { name: 'Simples' }, bot: { token: 'ABC123'} }
    response = double('faraday_response', body: response_json, status: 200)
    allow(Faraday).to receive(:post).with(url, json).and_return(response)

    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    ao = ApprovedOrder.last
    expect(ao.order_client).to be_accepted
    expect(ao.order_client.id).to eq(order.id)
    expect(ao.order_client.token).to eq(order.token)
    expect(ao.order_client.plan_id).to eq(order.plan_id)
    expect(response_json[:bot][:token]).to eq(ao.bot_token)
    expect(page).to have_content('Compra registrada')
  end

  scenario 'failed' do
    client = client_login
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com',
                      password: '123456')
    order = OrderClient.create!(token: 'ASDSAFdfsdfd', plan: 'Simples',
                                plan_id: 1, client: client)

    url = 'http://localhost:3000/api/v1/purchases'
    json = { company_token: order.token, plan_id: order.plan_id }
    response_json = { company: { name: company.fantasy_name },
                      plan: { name: 'Simples' }, bot: { token: 'ABC123'} }
    response = double('faraday_response', body: response_json, status: 500)
    allow(Faraday).to receive(:post).with(url, json).and_return(response)

    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    order = OrderClient.last
    expect(order).not_to be_accepted
    expect(page).to have_content('Compra não registrada')
  end
end