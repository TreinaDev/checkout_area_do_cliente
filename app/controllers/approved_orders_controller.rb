class ApprovedOrdersController < ApplicationController
  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @url = "#{Rails.configuration.management_api[:base_url]}/puschases/"
    sync_api
  end

  private

  def sync_api
    response = Faraday.post(@url, { company_token: @order_client.token,
                                    plan_id: @order_client.plan_id })
    return redirect_to @order_client, alert: t('.fail') if response.status != 200

    @order_client.accepted!
    @approved_order = @order_client.create_approved_order(bot_token: response.body[:bot][:token])
    redirect_to @order_client, notice: t('.success')
  end
end
