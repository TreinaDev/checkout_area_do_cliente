class OrdersController < ApplicationController
  before_action :authenticate_client!
  before_action :filter_client_order, only: [:index]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_client.orders.new(plan_id: params[:plan_id])
    @order.save
    redirect_to @order, notice: t('.notice')
  end

  def cancel
    @order = Order.find(params[:id]) 
    @order.canceled!
    redirect_to orders_path
  end

  private

  def filter_client_order
    if client_signed_in?
      @orders = Order.where(:client_id == current_client.id) 
    end
  end
end
