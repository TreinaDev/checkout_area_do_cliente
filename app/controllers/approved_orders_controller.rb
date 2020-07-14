class ApprovedOrdersController < ApplicationController
  def create
    @order_client = OrderClient.find(params[:order_client_id])
    if ApproveOrder.new(@order_client).call
      redirect_to @order_client, notice: t('.success')
    else
      redirect_to @order_client, alert: t('.fail')
    end
  end
end
