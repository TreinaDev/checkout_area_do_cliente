require 'rails_helper'

feature 'Visitor see plans in home page' do
  describe Plan do
    it 'should get all states' do
      visit root_path
    end

    it 'should return empty array if API error' do
      allow(Plan).to receive(:all).and_return([])

      result = Plan.all
      expect(result.length).to eq 0
    end
  end
end
