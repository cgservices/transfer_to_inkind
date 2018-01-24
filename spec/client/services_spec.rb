require 'spec_helper'

describe InkindApi::Client do
  it 'can retrieve services' do
    expect(InkindApi::Entity::Service)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
      
    VCR.use_cassette('services') do
      expect(CLIENT.services.size).to be > 0
    end
  end
end
