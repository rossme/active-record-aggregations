# frozen_string_literal: true

class Money
  include Comparable
  attr_reader :amount, :currency

  EXCHANGE_RATES = { 'USD_TO_DKK' => 6 }.freeze

  def initialize(amount, currency = 'USD')
    @amount = amount
    @currency = currency
  end

  def exchange_to(other_currency)
    exchanged_amount = (amount * EXCHANGE_RATES["#{currency}_TO_#{other_currency}"]).floor
    Money.new(exchanged_amount, other_currency)
  end

  def ==(other)
    amount == other.amount && currency == other.currency
  end

  def <=>(other)
    amount <=> if currency == other.currency
                 other.amount
               else
                 other.exchange_to(currency).amount
               end
  end
end
