class ManagementSystem
  class << self
    def client
      @client ||= new_connection
    end

    private

    def new_connection
      Faraday.new(url: management_system_url) do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
      end
    end

    def management_system_url
      "#{endpoint}/api/#{api_version}"
    end

    def endpoint
      Rails.configuration.management_api[:base_url]
    end

    def api_version
      'v1'
    end

  end
end
