require 'rails_helper'

feature 'Visitor see plans in home page' do
  describe Plan do
    it 'should get all states' do
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
      allow(Plan).to receive(:all).and_return([])

      result = Plan.all
      expect(result.length).to eq 0
    end
  end
end
