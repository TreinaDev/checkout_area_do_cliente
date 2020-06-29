class AprovedsController < ApplicationController
  def new
    @aproved = Aproved.new
    redirect_to plans_path
  end

  def create
    @aproveds = Aproved.create(require_params)
  end

  private

  def require_params
    params.require(:aproved).permit(:order_client_id, :employee_id)
  end
end
