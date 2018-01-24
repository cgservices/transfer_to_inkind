require 'spec_helper'

describe InkindApi::Client do
  it 'can ping the remote API' do
    VCR.use_cassette('ping') do
      response = CLIENT.ping?
      expect(response).to eql(true)
    end
  end
end
