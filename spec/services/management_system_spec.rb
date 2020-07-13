require 'rails_helper'

describe ManagementSystem do
  context '.client' do
    subject { ManagementSystem.client }
    it { is_expected.to be_instance_of(Faraday::Connection)  }

    it 'Content-Type: application/json header' do
      expect(subject.headers['Content-Type']).to eq('application/json')
    end

    it 'url points to management api' do
      expect(subject.url_prefix).to be_a(URI::HTTP)
      expect(subject.url_prefix.hostname).to eq('exemplo.com')
      expect(subject.url_prefix.path).to eq('/api/v1')
    end
  end
end
