class DropAprovedsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :aproveds do |t|
      t.integer "order_client_id", null: false
      t.integer "employee_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["employee_id"], name: "index_aproveds_on_employee_id"
      t.index ["order_client_id"], name: "index_aproveds_on_order_client_id"
    end
  end
end
