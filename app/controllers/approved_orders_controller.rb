class ApprovedOrdersController < ApplicationController
  def index
    @order_clients = OrderClient.where(client_id: 1)
  end
  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @approved_order = @order_client.create_approved_order
    @order_client.accepted!

    redirect_to @order_client
  end
end
