class ApprovedOrdersController < ApplicationController
  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @url = 'http://localhost:3000/api/v1/purchases'
    sync_api
  end

  private

  def sync_api
    response = Faraday.post(@url, { company_token: @order_client.token,
                                    plan_id: @order_client.plan_id })
    if response.status == 200
      @order_client.accepted!
      @approved_order = @order_client.create_approved_order
      @approved_order.update(bot_token: response.body[:bot][:token])
      redirect_to @order_client, notice: t('.success')
    else
      redirect_to @order_client, alert: t('.fail')
    end
  end
end
