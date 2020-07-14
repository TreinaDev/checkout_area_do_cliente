class AddTokenToOrderClient < ActiveRecord::Migration[6.0]
  def change
    add_column :order_clients, :token, :string
    add_index :order_clients, :token, unique: true
  end
end
