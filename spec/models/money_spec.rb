# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Money do
  let(:money) { Money.new(100) }

  it 'has an amount' do
    expect(money.amount).to eq(100)
  end

  it 'has a currency' do
    expect(money.currency).to eq('USD')
  end

  describe '#exchange_to' do
    it 'exchanges money to a different currency' do
      expect(money.exchange_to('DKK')).to eq(Money.new(600, 'DKK'))
    end
  end

  describe '#==' do
    it 'is equal to another money object with the same amount and currency' do
      expect(money).to eq(Money.new(100))
    end
  end

  describe '#<=>' do
    # if a < b then return -1
    # if a = b then return  0
    # if a > b then return  1
    # if a and b are not comparable then return nil

    it 'is less than another money object with a greater amount' do
      expect(money).to be < Money.new(200)
    end

    it 'is greater than another money object with a lesser amount' do
      expect(money).to be > Money.new(50)
    end

    it 'is equal to another money object with the same amount' do
      expect(money).to eq(Money.new(100))
    end
  end
end
