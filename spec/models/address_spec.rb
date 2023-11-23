# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  let(:address) { Address.new('123 Main St.', 'London') }

  it 'has a street' do
    expect(address.street).to eq('123 Main St.')
  end

  it 'has a city' do
    expect(address.city).to eq('London')
  end

  describe '#close_to?' do
    it 'is true when the cities match' do
      expect(address.close_to?(Address.new('456 High St.', 'London'))).to be true
    end

    it 'is false when the cities do not match' do
      expect(address.close_to?(Address.new('456 High St.', 'Paris'))).to be false
    end
  end
end
