# frozen_string_literal: true

require 'spec_helper'

describe InkindApi::Client do
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
      expect(CLIENT.operators.size).to be > 0
    end
  end

  it 'can retrieve products for operators' do
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

    VCR.use_cassette('products') do
      expect(CLIENT.products.size).to be > 0
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
      .and_call_original

    operator = VCR.use_cassette('operators') { CLIENT.operators.first }

    VCR.use_cassette('products') do
      expect(CLIENT.products(operator.id).size).to be > 0
    end
  end
end
