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
        company_token: order_client.token,
        plan_id: order_client.plan_id
      }
    end
  end

  def create_approved_order
    token = JSON.parse(@response.body, symbolize_names: true)[:bot][:token]
    order_client.create_approved_order bot_token: token
  end
end
