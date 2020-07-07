class Plan
  attr_reader :id, :name, :platforms, :limit_daily_chat,
              :limit_monthly_chat, :limit_daily_messages, :limit_monthly_messages,
              :extra_message_price, :extra_chat_price, :current_price

  def initialize(id:, name:, platforms:, limit_daily_chat:,
                 limit_monthly_chat:, limit_daily_messages:, limit_monthly_messages:,
                 extra_message_price:, extra_chat_price:, current_price:)
    @id = id
    @name = name
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
    json = JSON.parse(response, symbolize_names: true)
    result = json.map do |hash|
      new(id: hash[:id], name: hash[:name], platforms: hash[:platforms],
          limit_daily_chat: hash[:limit_daily_chat], limit_monthly_chat: hash[:limit_monthly_chat],
          limit_daily_messages: hash[:limit_daily_messages], limit_monthly_messages: hash[:limit_monthly_messages],
          extra_message_price: hash[:extra_message_price], extra_chat_price: hash[:extra_chat_price],
          current_price: hash[:current_price])
    end
    result
  end

  def self.response
    File.read(Rails.root.join('spec/fixtures/plans.json'))
  end
end
