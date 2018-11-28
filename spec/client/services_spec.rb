# frozen_string_literal: true

describe InkindApi::Client do
  subject { described_class.new(config: InkindApi::Config.new) }
  it 'can retrieve services' do
    expect(InkindApi::Entity::Service)
      .to receive(:new)
      .at_least(:once)
      .and_call_original

    VCR.use_cassette('services') do
      expect(subject.services.size).to be > 0
    end
  end
end
