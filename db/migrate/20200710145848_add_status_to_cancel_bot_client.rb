class AddStatusToCancelBotClient < ActiveRecord::Migration[6.0]
  def change
    add_column :cancel_bot_clients, :status, :integer, default: 0
  end
end
