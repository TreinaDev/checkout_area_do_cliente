class OrderClientsController < ApplicationController
  before_action :authenticate_visitor
  def index
    @order_clients = OrderClient.all
  end

  def show
    @order_client = OrderClient.find(params[:id])
  end

  private
  
  def authenticate_visitor
    if not current_client and not current_employee
      redirect_to root_path
    end
  end
end
