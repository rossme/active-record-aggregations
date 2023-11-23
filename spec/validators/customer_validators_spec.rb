# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomerAggregations::Base do
  describe '#validate_attributes' do
    let(:customer) { Customer.new }
    let(:balance) { Money.new(100, 'USD') }

    it 'is invalid when the address has no street' do
      customer.address = Address.new(nil, 'Ruby Town')
      customer.balance = balance

      expect(customer).to be_invalid
    end

    let(:address) { Address.new('123 Main St.', 'London') }

    it 'is valid when the address has a street and city' do
      customer.address = address
      customer.balance = balance

      expect(customer).to be_valid
    end
  end
end
