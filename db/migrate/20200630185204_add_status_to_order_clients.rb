class AddStatusToOrderClients < ActiveRecord::Migration[6.0]
  def change
    add_column :order_clients, :status, :integer, default: 0
  end
end
