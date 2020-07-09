class RejectedOrder < ApplicationRecord
  belongs_to :order_client

  validates :reason, presence: true
end
