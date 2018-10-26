# frozen_string_literal: true

require 'spec_helper'

describe InkindApi::Client do
  it 'can retrieve countries' do
    expect(InkindApi::Entity::Country)
      .to receive(:new)
      .at_least(:once)
      .and_call_original

    VCR.use_cassette('countries') do
      expect(CLIENT.countries.size).to be > 0
    end
  end
end
