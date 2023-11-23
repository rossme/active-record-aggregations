# frozen_string_literal: true

class Customer < ApplicationRecord
  composed_of :balance, class_name: 'Money', mapping: { balance: :amount }
  composed_of :address, mapping: { address_street: :street, address_city: :city }

  validates_with CustomerAggregations::Address, on: :create
  validates_with CustomerAggregations::Balance, on: :create
end
