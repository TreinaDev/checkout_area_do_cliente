class OrdersController < ApplicationController
  def index
		@orders = Order.all
  end
  def checked

  end
end
