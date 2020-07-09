class AddPlanIdClientToOrderClients < ActiveRecord::Migration[6.0]
  def change
    add_column :order_clients, :plan_id, :integer
    add_reference :order_clients, :client, foreign_key: true
  end
end
