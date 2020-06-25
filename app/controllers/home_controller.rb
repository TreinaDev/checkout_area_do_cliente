class HomeController < ApplicationController
  def index
    @plans = Plan.all
  end
end
