# ActiveRecord Aggregations Playground

This repository serves as a playground for learning about Active Record Aggregations and their uses. Specifically focusing on the `composed_of` macro for representing attributes as value objects. The example below demonstrates how to use this feature.

## Usage

In an ActiveRecord model, we can use `composed_of` to define relationships with value objects:

```ruby
class Customer < ApplicationRecord
  composed_of :balance, class_name: 'Money', mapping: { balance: :amount }
  composed_of :address, mapping: { address_street: :street, address_city: :city }

  validates_with CustomerAggregations::Address, on: :create
  validates_with CustomerAggregations::Balance, on: :create
end
```

The `validate_attributes(record)` private method below returns an array composed of a boolean and a symbol.
The boolean represents the validation result and the symbol represents the aggregation class name that failed validation.
This allows us to use the same validator for multiple attributes.

```ruby
module CustomerAggregations
  class Address < Base

    private

    def validate_attributes(record)
      [record.address.city.present? && record.address.street.present?, :address]
    end
  end
end
```

```ruby
module CustomerAggregations
  class Base < ActiveModel::Validator

    private

    def validate(record)
      result = validate_attributes(record)
      return if result.include?(true)

      record.errors.add :base, "#{result[1]} record is invalid."
    end
  end
end
```

```ruby
# basic validator concern

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
```

## Further information
[ActiveRecord::Aggregations](https://api.rubyonrails.org/classes/ActiveRecord/Aggregations/ClassMethods.html)