class ApprovedOrder < ApplicationRecord
  belongs_to :order_client
end
