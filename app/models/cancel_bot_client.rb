class CancelBotClient < ApplicationRecord
  belongs_to :approved_order
  validates :reason, presence: true
  enum status: { waiting: 0, accepted: 5, rejected: 10 }
end
