class CreateOrderClients < ActiveRecord::Migration[6.0]
  def change
    create_table :order_clients do |t|
      t.string :token
      t.string :plan
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
