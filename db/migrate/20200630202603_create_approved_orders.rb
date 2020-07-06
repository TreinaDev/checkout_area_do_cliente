class CreateApprovedOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :approved_orders do |t|
      t.references :order_client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
