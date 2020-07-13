class OrderClientsController < ApplicationController
  before_action :authenticate_visitor
  before_action :authorize_employee, only: %i[index]

  def index
    @order_clients = OrderClient.all
  end

  def show
    @order_client = OrderClient.find(params[:id])
    return unless client_signed_in?
    return if current_client.id == @order_client.client.id

    redirect_to root_path, alert: t('authorization', scope: %i[company sessions])
  end
end
