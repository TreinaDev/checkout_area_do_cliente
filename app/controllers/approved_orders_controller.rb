class ApprovedOrdersController < ApplicationController
  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @approved_order = ApprovedOrder.create(params.permit(:order_client))
    @approved_order.order_client = @order_client
    @order_client.accepted!
    @approved_order.save

    redirect_to @order_client
  end

  private

  def require_params
    params.require(:approved_order).permit(:order_client)
  end
end
