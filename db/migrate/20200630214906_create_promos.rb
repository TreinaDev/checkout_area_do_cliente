class CreatePromos < ActiveRecord::Migration[6.0]
  def change
    create_table :promos do |t|
      t.string :title
      t.integer :discount
      t.date :start_date
      t.date :end_date
      t.integer :limit_order, default:0

      t.timestamps
    end
  end
end
