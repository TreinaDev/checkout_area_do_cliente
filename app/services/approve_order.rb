class ApproveOrder
  attr_reader :order_client

  def initialize(order_client)
    @order_client = order_client
  end

  def call
    @response = post_order
    return false unless @response.status == 200

    order_client.accepted!
    create_approved_order
    true
  end

  private

  def post_order
    ManagementSystem.client.post do |req|
      req.url 'purchases'
      req.body = {
        purchase: {
          company_token: order_client.company_token,
          plan_id: order_client.plan_id
        }
      }.to_json
    end
  end

  def create_approved_order
    token = JSON.parse(@response.body, symbolize_names: true)[:bot_token]
    order_client.create_approved_order bot_token: token
  end
end
