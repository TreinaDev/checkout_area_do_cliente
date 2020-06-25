class AddAttributesToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :fantasy_name, :string
    add_column :companies, :corporate_name, :string
    add_column :companies, :email, :string
    add_column :companies, :document_number, :string
    add_column :companies, :address, :string
  end
end
