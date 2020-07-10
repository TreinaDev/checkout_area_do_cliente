class AddBotTokenToApprovedOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :approved_orders, :bot_token, :string
  end
end
