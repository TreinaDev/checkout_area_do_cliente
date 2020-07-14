class RemoveTokenFromOrderClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_clients, :token, :string
  end
end
