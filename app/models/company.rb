class Company < ApplicationRecord
  belongs_to :client

  validates :fantasy_name, :corporate_name, :email, :cnpj,
            uniqueness: true
  validates :fantasy_name, :corporate_name, :email, :cnpj,
            :address, presence: true
  validate :cnpj_validation

  has_secure_token

  after_create_commit :send_company_to_management_system

  private

  def cnpj_validation
    return if CNPJ.valid?(cnpj)

    errors.add(:cnpj, 'CNPJ não é valido')
  end

  def send_company_to_management_system
    ManagementSystem.client.post do |req|
      req.url 'companies'
      req.body = attributes.to_json
    end
  end
end
