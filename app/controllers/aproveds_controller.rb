class AprovedsController < ApplicationController
  def create
    @order_client = OrderClient.find(params[:id])
    @order_client.create_aproved(require_params)

    redirect_to order_clients_path
  end

  private

  def require_params
    params.require(:aproved).permit(:order_client_id, :employee_id)
  end
end
