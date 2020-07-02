class Order < ApplicationRecord
  belongs_to :client

  enum status: { open: 0, accepted: 5, rejected: 10, canceled: 15 }
end
