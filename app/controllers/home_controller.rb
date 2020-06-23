class HomeController < ApplicationController
  def index 
    @plans = Plan.all
  end
  
  private 

  def authenticate_visitor
    if not client_signed_in? 
      redirect_to root_path
    end
  end
end