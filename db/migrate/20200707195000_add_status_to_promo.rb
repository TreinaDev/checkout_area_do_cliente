class AddStatusToPromo < ActiveRecord::Migration[6.0]
  def change
    add_column :promos, :status, :integer, default: 0
    add_reference :promos, :employee, null: false, foreign_key: true
  end
end
