class OrderClient < ApplicationRecord
  enum status: { waiting: 0, accepted: 5, rejected: 10 }
  has_one :approved_order, dependent: :destroy
end
