class Company < ApplicationRecord
  belongs_to :client

  validates :fantasy_name, :corporate_name, :email, :document_number,
            uniqueness: true
  validates :fantasy_name, :corporate_name, :email, :document_number,
            :address, presence: true
  validate :cnpj_validation

  private

  def cnpj_validation
    return if CNPJ.valid?(document_number)

    errors.add(:cnpj, 'CNPJ não é valido')
  end
end
