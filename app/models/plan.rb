class Plan
	attr_reader :platform, :price, :limit_daily, :limit_monthly, :cost, :promo

	def initialize(platform:, price:, limit_daily:, limit_monthly:, cost:, promo:)
	    @platform = platform
	    @price = price
	    @limit_daily = limit_daily
	    @limit_monthly = limit_monthly
	    @cost = cost
	    @promo = promo
	end
end
Plan.new(platform: 'Facebook', 
                      price: 3000.00, 
                      limit_daily: 400,
                      limit_monthly: 10000,
                      cost: 0.50,
                      promo: 'Promoção Facebook')

Plan.new(platform: 'Whatsapp', 
                      price: 4000.00, 
                      limit_daily: 800,
                      limit_monthly: 18000,
                      cost: 0.80,
                      promo: 'Promoção Whatsapp')


