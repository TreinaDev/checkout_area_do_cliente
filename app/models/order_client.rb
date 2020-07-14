class OrderClient < ApplicationRecord
  has_one :approved_order, dependent: :destroy
  has_one :rejected_order, dependent: :destroy
  belongs_to :client
  has_secure_token

  enum status: { waiting: 0, accepted: 5, rejected: 10, canceled: 15 }

  def company_token
    client.company.token
  end

  def plan
    Plan.find(plan_id)
  end

  def bot_token
    approved_order&.bot_token
  end

  def rejected!
    super
    ManagementSystem.client.post do |req|
      req.url 'purchase_cancellations'
      req.body = { purchase: { token: token } }
    end
  end
end
