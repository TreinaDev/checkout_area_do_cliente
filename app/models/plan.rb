class Plan
  attr_reader :id, :name, :platforms, :created_at, :updated_at, :limit_daily_chat,
              :limit_monthly_chat, :limit_daily_messages, :limit_monthly_messages,
              :extra_message_price, :extra_chat_price, :current_price

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.all
    response = ManagementSystem.client.get { |req| req.url 'plans' }
    return [] unless response.status == 200

    json = JSON.parse(response.body, symbolize_names: true)
    json.map { |hash| new(hash) }
  end

  def self.find(id)
    response = ManagementSystem.client.get { |req| req.url "plans/#{id}" }

    hash = JSON.parse(response.body, symbolize_names: true)
    new(hash)
  end
end
