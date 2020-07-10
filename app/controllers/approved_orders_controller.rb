class ApprovedOrdersController < ApplicationController
  def index
    @order_clients = OrderClient.where(client_id: current_client.id, status: :accepted)
  end

  def show
    @approved_order = ApprovedOrder.find(params[:id])
    @plan = Plan.find(@approved_order.order_client.plan_id)
  end

  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @approved_order = @order_client.create_approved_order
    @order_client.accepted!

    redirect_to @order_client
  end
end
