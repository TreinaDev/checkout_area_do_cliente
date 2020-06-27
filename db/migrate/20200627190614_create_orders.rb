class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :token
      t.integer :status, default:0
      t.string :plan
      t.integer :first_employee_id 
      t.integer :second_employee_id 

      t.timestamps
    end
  end
end
