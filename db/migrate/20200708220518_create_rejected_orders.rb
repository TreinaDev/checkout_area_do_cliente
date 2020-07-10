class CreateRejectedOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :rejected_orders do |t|
      t.references :order_client, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
