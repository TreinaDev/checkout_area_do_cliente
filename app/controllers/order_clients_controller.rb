class OrderClientsController < ApplicationController
  def index
    @order_clients = OrderClient.all
    @aproved = Aproved.all
  end
end
