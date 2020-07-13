RSpec.configure do |config|
  config.before(:each, type: :feature) do
    raw_json = File.read(Rails.root.join('spec/fixtures/plans.json'))
    stub_request(:get, 'http://exemplo.com/api/v1/plans')
      .to_return(status: 200, body: raw_json)
  end

  config.before(:each, type: :request) do
    raw_json = File.read(Rails.root.join('spec/fixtures/plans.json'))
    stub_request(:get, 'http://exemplo.com/api/v1/plans')
      .to_return(status: 200, body: raw_json)
  end
end
