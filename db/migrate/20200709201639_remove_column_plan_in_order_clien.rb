class RemoveColumnPlanInOrderClien < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_clients, :plan
  end
end
