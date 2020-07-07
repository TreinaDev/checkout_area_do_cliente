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
    response = File.read(Rails.root.join('spec/fixtures/plans.json'))

    json = JSON.parse(response, symbolize_names: true)

    result = json.map do |hash|
      new(id: hash[:id], platform: hash[:platform], price: hash[:price],
          limit_daily: hash[:limit_daily], limit_monthly: hash[:limit_monthly],
          cost: hash[:cost], promo: hash[:promo])
    end
    result
  end
end
