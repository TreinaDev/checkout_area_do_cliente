class OrderClient < ApplicationRecord
  has_one :approved_order, dependent: :destroy
  has_one :rejected_order, dependent: :destroy
  belongs_to :client

  enum status: { waiting: 0, accepted: 5, rejected: 10, canceled: 15 }
end
