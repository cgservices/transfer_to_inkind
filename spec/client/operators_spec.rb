# frozen_string_literal: true

describe InkindApi::Client do
  subject { described_class.new(config: InkindApi::Config.new) }

  it 'can retrieve operators' do
    expect(InkindApi::Entity::Operator)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::Country)
      .to receive(:new)
      .at_least(:once)
      .and_call_original

    VCR.use_cassette('operators') do
      expect(subject.operators.size).to be > 0
    end
  end
end
