class CancelBotClientsController < ApplicationController
  def new
    @approved_order = ApprovedOrder.find(params[:approved_order_id])
    @cancel_bot_client = CancelBotClient.new
  end

  def show
    @cancel_bot_client = CancelBotClient.find(params[:id])
  end

  def create
    @approved_order = ApprovedOrder.find(params[:approved_order_id])
    @cancel_bot_client = @approved_order.create_cancel_bot_client(cancel_bot_client)

    if @cancel_bot_client.save
      @cancel_bot_client.waiting!
      redirect_to approved_orders_path, notice: t('flash.cancel_bot_client.waiting')
    else
      render :new
    end
  end

  private

  def cancel_bot_client
    params.require(:cancel_bot_client).permit(:reason)
  end
end
