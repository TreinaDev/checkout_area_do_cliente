class AddClientToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :client, null: false, foreign_key: true
  end
end
