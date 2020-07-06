require 'rails_helper'

feature 'Visitor see plans in home page' do
  describe Plan do
    it 'should get all states information' do
      json = File.read(Rails.root.join('spec/support/plans.json'))
      response = double('faraday_response', body: json, status: 200)
      allow(Plan).to receive(:all).and_return(json)
      result = Plan.all

      expect(result.length).to eq 3
      expect(result[0].platform).to eq 'Facebook'
      expect(result[0].price).to eq 3000.00
      expect(result[0].limit_monthly).to eq 400
      expect(result[0].limit_daily).to eq 10_000
      expect(result[0].cost).to eq 0.50
      expect(result[0].promo).to eq 'Promoção Facebook'

      expect(result[1].platform).to eq 'Whatsapp'
      expect(result[1].price).to eq 4000.00
      expect(result[1].limit_monthly).to eq 500
      expect(result[1].limit_daily).to eq 20_000
      expect(result[1].cost).to eq 0.40
      expect(result[1].promo).to eq 'Promoção Whatsapp'

      expect(result[2].platform).to eq 'Magazine Luiza'
      expect(result[2].price).to eq 5000.00
      expect(result[2].limit_monthly).to eq 600
      expect(result[2].limit_daily).to eq 30_000
      expect(result[2].cost).to eq 0.30
      expect(result[2].promo).to eq 'Promoção Magazine Luiza'
    end

    it 'should return return empty array  if API error' do
      response = double('faraday_response', body: "{}", status: 500)
      allow(Plan).to receive(:get).with(url).and_return(response)

      result = Plan.all
      expect(result.length).to eq 0
    end
  end
end
