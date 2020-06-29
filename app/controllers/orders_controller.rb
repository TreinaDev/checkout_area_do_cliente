class OrdersController < ApplicationController
  before_action :authenticate_client!

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(plan: params[:plan_id])
    @order.plan = params[:plan_id]
    @order.client = current_client
    @order.save
    flash[:notice] = 'Compra efetuada com sucesso'
    redirect_to @order
  end
end
