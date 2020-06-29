class Aproved < ApplicationRecord
  belongs_to :order_client
  belongs_to :employee
end
