class CreateCancelBotClients < ActiveRecord::Migration[6.0]
  def change
    create_table :cancel_bot_clients do |t|
      t.references :approved_order, null: false, foreign_key: true
      t.string :reason

      t.timestamps
    end
  end
end
