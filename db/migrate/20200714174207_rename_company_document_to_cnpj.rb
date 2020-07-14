class RenameCompanyDocumentToCnpj < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :document_number, :cnpj
  end
end
