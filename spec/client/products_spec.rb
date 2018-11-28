# frozen_string_literal: true

describe InkindApi::Client do
  subject { described_class.new(config: InkindApi::Config.new) }
  it 'can retrieve products for operators' do
    expect(InkindApi::Entity::Operator)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::Country)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::FixedValueProduct)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::VariableValueProduct)
      .to receive(:new)
      .at_least(:once)
      .and_call_original

    VCR.use_cassette('products') do
      expect(subject.products.size).to be > 0
    end
  end

  it 'can retrieve products for a specific operator' do
    expect(InkindApi::Entity::Operator)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::Country)
      .to receive(:new)
      .at_least(:once)
      .and_call_original
    expect(InkindApi::Entity::Product)
      .to receive(:new)
      .at_least(:once)

    operator = VCR.use_cassette('operators') { subject.operators.first }

    VCR.use_cassette('products') do
      expect(subject.products(operator.id).size).to be > 0
    end
  end
end
