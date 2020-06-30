class OrderClientsController < ApplicationController
  def index
    @order_clients = OrderClient.all
    @aproveds = Aproved.all
  end
end
