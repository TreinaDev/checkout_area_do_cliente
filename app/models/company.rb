class Company < ApplicationRecord
  belongs_to :client

  validates :fantasy_name, :corporate_name, :email, :document_number,
            uniqueness: true
  validates :fantasy_name, :corporate_name, :email, :document_number,
            :address, presence: true
end
