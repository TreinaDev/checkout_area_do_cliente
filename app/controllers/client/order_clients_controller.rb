class Client::OrderClientsController < ApplicationController
  before_action :authenticate_client!

  def index
    @order_clients = current_client.order_clients
  end

  def cancel
    @order_client = OrderClient.find(params[:id])
    @order_client.canceled!
    redirect_to client_order_clients_path
  end

  def create
    @order_client = current_client.order_clients.new(plan_id: params[:plan_id])
    @plan = Plan.find(params[:plan_id])
    @order_client.plan = @plan.first.platform
    @order_client.save
    redirect_to @order_client, notice: t('.notice')
  end
end
