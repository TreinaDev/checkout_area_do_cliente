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
    response = Faraday.get('spec/fixtures/plans.json')

    return {} unless response.status == 200

    json = JSON.parse(response.body, symbolize_names: true)[:data]
    result = json.map do |hash|
      new(hash)
    end
    result
  end
end
