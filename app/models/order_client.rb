class OrderClient < ApplicationRecord
  has_one :approved_order, dependent: :destroy
  has_one :rejected_order, dependent: :destroy
  belongs_to :client
  before_create :generate_token

  enum status: { waiting: 0, accepted: 5, rejected: 10, canceled: 15 }

  private 

  def generate_token
    self.token = loop do
      token = SecureRandom.alphanumeric(6).upcase
      break token unless OrderClient.exists?(token: token)
    end
  end
end
