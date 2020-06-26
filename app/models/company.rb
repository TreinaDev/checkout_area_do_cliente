class Company < ApplicationRecord
  belongs_to :client

  validates :fantasy_name, :corporate_name, :email, :document_number,
            presence: true, uniqueness: true
  validates :address, presence: true
end
