class ApprovedOrder < ApplicationRecord
  has_one :rejected_order, dependent: :destroy
  has_one :cancel_bot_client, dependent: :destroy
  belongs_to :order_client
end
