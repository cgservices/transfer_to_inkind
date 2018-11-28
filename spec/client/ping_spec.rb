# frozen_string_literal: true

describe InkindApi::Client do
  subject { described_class.new(config: InkindApi::Config.new) }

  it 'can ping the remote API' do
    VCR.use_cassette('ping') do
      expect(subject.ping?).to eql(true)
    end
  end
end
