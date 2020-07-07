class Plan
  attr_reader :id, :name, :platforms, :created_at, :updated_at, :limit_daily_chat,
              :limit_monthly_chat, :limit_daily_messages, :limit_monthly_messages,
              :extra_message_price, :extra_chat_price, :current_price

  def initialize(id:, name:, created_at:, updated_at:, platforms:,
                 limit_daily_chat:, limit_monthly_chat:, limit_daily_messages:,
                 limit_monthly_messages:, extra_message_price:, extra_chat_price:,
                 current_price:)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @platforms = platforms
    @limit_daily_chat = limit_daily_chat
    @limit_monthly_chat = limit_monthly_chat
    @limit_daily_messages = limit_daily_messages
    @limit_monthly_messages = limit_monthly_messages
    @extra_message_price = extra_message_price
    @extra_chat_price = extra_chat_price
    @current_price = current_price
  end

  def self.all
    response = Faraday.get('http://localhost:3001/api/v1/plans/')

    return {} unless response.status == 200

    json = JSON.parse(response.body, symbolize_names: true)
    result = json.map do |hash|
      new(hash)
    end
    result
  end
end
