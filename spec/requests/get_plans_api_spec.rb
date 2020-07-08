require 'rails_helper'

feature 'Visitor see plans in home page' do
  describe Plan do
    it 'should get all states' do      
      url = 'http://localhost:4000/api/v1/plans/'
      response = double('faraday_response', status: 200)
      allow_any_instance_of(Faraday::Connection).to receive(:get).with(url).and_return(response)

      plans = Plan.all
      expect(plans[0].name).to eq 'totam'
      expect(plans[0].platforms).to eq 'Whatsapp'
      expect(plans[0].limit_daily_chat).to eq 1
      expect(plans[0].limit_monthly_chat).to eq 1
      expect(plans[0].limit_daily_messages).to eq 1
      expect(plans[0].limit_monthly_messages).to eq 1
      expect(plans[0].extra_message_price).to eq 1.5
      expect(plans[0].extra_chat_price).to eq 1.5
      expect(plans[0].current_price).to eq 67.27
    end

    it 'should return empty array if API error' do      
      url = 'http://localhost:4000/api/v1/plans/'      
      response = double('spec/fixtures/plans.json', body: '', status: 500)
      allow_any_instance_of(Faraday::Connection).to receive(:get).with(url).and_return(response)

      plans = Plan.all
      expect(plans.length).to eq 0
    end
  end
end
