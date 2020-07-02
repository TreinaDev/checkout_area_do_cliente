class OrderClientsController < ApplicationController
  before_action :authenticate_visitor
  def index
    @order_clients = OrderClient.all
  end

  def show
    @order_client = OrderClient.find(params[:id])
  end
end
