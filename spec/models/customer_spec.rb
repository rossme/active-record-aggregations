require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'has an address' do
    let(:customer) { Customer.new(address: Address.new('123 Main St.', 'London')) }

    it 'has a street' do
      expect(customer.address_street).to eq('123 Main St.')
    end

    it 'has a city' do
      expect(customer.address_city).to eq('London')
    end

    it 'is composed of an address' do
      expect(customer.address).to eq(Address.new('123 Main St.', 'London'))
    end
  end

  describe 'has a balance' do
    let(:customer) { Customer.new(balance: Money.new(100, 'USD')) }

    it 'is composed of a balance' do
      expect(customer.balance).to eq(Money.new(100))
    end

    it 'can exchange currency to DKK at 6*' do
      expect(customer.balance.exchange_to('DKK')).to eq(Money.new(600, 'DKK'))
    end
  end
end
