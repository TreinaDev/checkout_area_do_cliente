class Client::OrdersController < ApplicationController
  before_action :authenticate_client!

  def index
    @orders = current_client.orders
  end

  def cancel
    @order = Order.find(params[:id])
    @order.canceled!
    redirect_to orders_path
  end

  def create
    @order = current_client.orders.new(plan_id: params[:plan_id])
    @order.save
    redirect_to @order, notice: t('.notice')
  end
end
