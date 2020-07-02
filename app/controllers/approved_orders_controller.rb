class ApprovedOrdersController < ApplicationController
  def create
    @approved_order = ApprovedOrder.create(params.permit(:order_client))
    @approved_order.save
    # @approved_order.order_client = @order_client
    @order_client = OrderClient.find(params[:order_client_id])
    @order_client.accepted!

    redirect_to @order_client
  end

  private

  def require_params
    params.require(:approved_order).permit(:order_client)
  end
end
