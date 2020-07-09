require 'rails_helper'

feature 'Order to api' do
  scenario 'successfully' do
    client = client_login
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples', plan_id: 1, client: client)
    
    url = 'http://localhost:3000/api/v1/purchases'
    json = { company_token: order.token, plan_id: order.plan_id }
    response_json = { company: { name: company.fantasy_name }, plan: { name: 'Simples' }, bot: { token: 'ABC123'} }
    response = double('faraday_response', body: response_json, status: 200)

    allow(Faraday).to receive(:post).with(url, json).and_return(response)
    
    
    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    expect(order.status).to eq :accepted
    # expect(order).to be_accepted
    expect(order.bot_token).to eq 'ABAC123'
  end

  scenario 'failed' do
    client = client_login
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com', password: '123456')
    order = create(:order_client, token: 'FHDBFHDB', plan: 'Simples', plan_id: 1, client: client)
    
    url = 'http://localhost:3000/api/v1/purchases'
    json = { company_token: order.token, plan_id: order.plan_id }
    response_json = { company: { name: company.fantasy_name }, plan: { name: 'Simples' }, bot: { token: 'ABC123'} }
    response = double('faraday_response', body: response_json, status: 500)

    allow(Faraday).to receive(:post).with(url, json).and_return(response)
    
    
    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    expect(order.accepted?).to be_true
    
  end
end