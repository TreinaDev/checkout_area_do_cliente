class Client < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company, dependent: :destroy
  has_many :orders, dependent: :destroy
end
