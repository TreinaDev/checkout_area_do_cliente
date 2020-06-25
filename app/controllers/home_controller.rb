class HomeController < ApplicationController
  before_action :complete_company

  def index
    @plans = Plan.all
  end
end
