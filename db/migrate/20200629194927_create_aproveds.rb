class CreateAproveds < ActiveRecord::Migration[6.0]
  def change
    create_table :aproveds do |t|
      t.references :order_client, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
