class ApprovedOrdersController < ApplicationController

  def create
    @order_client = OrderClient.find(params[:order_client_id])
    sync_api
    redirect_to @order_client
  end

  private

  def sync_api
    url = 'http://localhost:3000/api/v1/purchases'
    response = Faraday.post(url, { company_token: @order_client.token,
                                   plan_id: @order_client.plan_id })
    if response.status == 200
      @approved_order = @order_client.create_approved_order
      @order_client.accepted!
      byebug
      # @approved_order.bot_token = response.body['bot']['token']
    else
      redirect_to @order_client, notice: t('.notice')
    end
  end
end
