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
    @cancel_bot_client = CancelBotClient.new(cancel_bot_client)
    @url = "#{Rails.configuration.management_api[:base_url]}/purchase_cancellations/"
    sync_api
  end

  private

  def cancel_bot_client
    params.require(:cancel_bot_client).permit(:reason)
  end

  def sync_api
    response = Faraday.post(@url, { purchase: { token: 'MMM000' },
                                    reason: @cancel_bot_client.reason })

    return redirect_to approved_orders_path, alert: t('flash.cancel_bot_client.fail') if response.status != 200
    return redirect_to approved_orders_path, alert: t('flash.cancel_bot_client.existent') if response.status == 400
    return redirect_to approved_orders_path, alert: t('flash.cancel_bot_client.not_found') if response.status == 404

    cancel_bot_client = @approved_order.create_cancel_bot_client(cancel_bot_client)

    return unless cancel_bot_client.save

    cancel_bot_client.waiting!
    redirect_to approved_orders_path, notice: t('flash.cancel_bot_client.waiting')
  end
end
