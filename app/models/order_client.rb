class OrderClient < ApplicationRecord
  enum status: { waiting: 0, accepted: 1, rejected: 2 }
  has_one :approved_order, dependent: :destroy
end
