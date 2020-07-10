class Api::V1::CancelBotClientsController < Api::V1::ApiController
  def show
    cancel_bot_client = CancelBotClient.find(params[:id])
    approved_order = cancel_bot_client.approved_order
    order = approved_order.order_client
    company = Company.where(client_id: order.client_id)
    render json: {"purchase": { "token": order.token} , "reason": cancel_bot_client.reason}
  end
end
