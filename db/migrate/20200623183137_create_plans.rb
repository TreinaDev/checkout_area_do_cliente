class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|

      t.timestamps
    end
  end
end
