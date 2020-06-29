class AddMissingIdexesToCompany < ActiveRecord::Migration[6.0]
  def change
    add_index :companies, :fantasy_name, unique: true
    add_index :companies, :corporate_name, unique: true
    add_index :companies, :email, unique: true
    add_index :companies, :document_number, unique: true
  end
end
