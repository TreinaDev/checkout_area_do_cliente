require 'rails_helper'

feature 'Order to api' do
  scenario 'successfully' do
    client = create(:client)
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com',
                                 password: '123456')
    order = OrderClient.create!(token: 'ASDSAFdfsdfd',
                                plan: 'Simples', plan_id: 1, client: client)

    response_json = { company_id: company.id,
                      token: 'ABC123' }
    stub_request(:post, 'http://exemplo.com/api/v1/purchases')
      .to_return(status: 200, body: response_json.to_json)

    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    ao = ApprovedOrder.last
    expect(ao.order_client).to be_accepted
    expect(ao.order_client.id).to eq(order.id)
    expect(ao.order_client.token).to eq(order.token)
    expect(ao.order_client.plan_id).to eq(order.plan_id)
    expect(response_json[:token]).to eq(ao.bot_token)
    expect(page).to have_content('Compra registrada')
    expect(page).not_to have_content('Aguardando aprovação')
    expect(page).not_to have_content('Rejeitado')
  end

  scenario 'failed' do
    client = create(:client)
    company = create(:company, client: client)
    employee = create(:employee, email: 'vendedor@empresa.com',
                                 password: '123456')
    order = OrderClient.create!(plan: 'Simples',
                                plan_id: 1, client: client)

    response_json = { company: { name: company.fantasy_name },
                      plan: { name: 'Simples' }, bot: { token: 'ABC123' } }
    stub_request(:post, 'http://exemplo.com/api/v1/purchases')
      .to_return(status: 500, body: response_json.to_json)

    login_as employee, scope: :employee

    visit order_clients_path
    click_on order.token
    click_on 'Aprovar Pedido'

    order = OrderClient.last
    expect(order).not_to be_accepted
    expect(page).to have_content('Compra não registrada')
  end
end
