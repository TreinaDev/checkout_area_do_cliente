class Client < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company, dependent: :destroy
  has_many :order_clients, dependent: :nullify

  def from?(company)
    return true if self.company == company

    false
  end
end
