class Order < ApplicationRecord
  enum status: { open: 0, checked: 5, approved: 10, rejected: 15 }
end
