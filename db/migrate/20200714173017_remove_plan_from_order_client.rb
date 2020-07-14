class RemovePlanFromOrderClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_clients, :plan, :string
  end
end
