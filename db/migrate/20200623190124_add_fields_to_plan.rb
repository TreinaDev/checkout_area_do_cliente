class AddFieldsToPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :platform, :string
    add_column :plans, :price, :double
    add_column :plans, :limit_daily, :integer
    add_column :plans, :limit_monthly, :integer
    add_column :plans, :cost, :double
    add_column :plans, :promo, :string
  end
end
