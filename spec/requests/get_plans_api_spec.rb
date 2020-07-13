require 'rails_helper'

feature 'Visitor see plans in home page' do
  describe Plan do
    it 'should get all states' do
      plans = Plan.all

      expect(plans[0].name).to eq 'totam'
      expect(plans[0].platforms).to eq 'Whatsapp'
      expect(plans[0].limit_daily_chat).to eq 1
      expect(plans[0].limit_monthly_chat).to eq 55
      expect(plans[0].limit_daily_messages).to eq 11
      expect(plans[0].limit_monthly_messages).to eq 21
      expect(plans[0].extra_message_price).to eq 1.6
      expect(plans[0].extra_chat_price).to eq 1.8
      expect(plans[0].current_price).to eq 67.27
    end

    it 'should return empty array if API error' do
      stub_request(:get, 'http://exemplo.com/api/v1/plans')
        .to_return(status: 500)
      plans = Plan.all

      expect(plans.length).to eq 0
    end
  end
end
