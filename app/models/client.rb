class Client < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company, dependent: :destroy
  has_many :orders, dependent: :destroy

  def from?(company)
    return true if self.company == company

    false
  end
end
