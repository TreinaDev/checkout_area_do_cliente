class Plan
  attr_reader :id, :platform, :price, :limit_daily,
              :limit_monthly, :cost, :promo

  def initialize(id:, platform:, price:, limit_daily:,
                 limit_monthly:, cost:, promo:)
    @id = id
    @platform = platform
    @price = price
    @limit_daily = limit_daily
    @limit_monthly = limit_monthly
    @cost = cost
    @promo = promo
  end

  def self.all
    [
      new(id: 1, platform: 'Facebook', price: 3000.00, limit_daily: 400,
          limit_monthly: 10_000, cost: 0.50, promo: 'Promoção Facebook'),
      new(id: 2, platform: 'Whatsapp', price: 4000.00, limit_daily: 800,
          limit_monthly: 18_000, cost: 0.80, promo: 'Promoção Whatsapp')
    ]
  end

  def self.find(id)
    all.find { |element| element.id == id }
  end
end
