class PlansController < ApplicationController
  before_action :authenticate_client!
  def index
    @plans = Plan.all
  end
end
