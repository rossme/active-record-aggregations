# ActiveRecord Aggregations Playground

This repository serves as a playground for learning about Active Record aggregations and their uses. Specifically focusing on the `composed_of` macro for representing attributes as value objects. The example below demonstrates how to use this feature.

## Usage

In an ActiveRecord model, we can use `composed_of` to define relationships with value objects:

```ruby
class Customer < ActiveRecord::Base
  composed_of :balance, class_name: "Money", mapping: { balance: :amount }
  composed_of :address, mapping: { address_street: :street, address_city: :city }
end
```

## Further information
[ActiveRecord::Aggregations](https://api.rubyonrails.org/classes/ActiveRecord/Aggregations/ClassMethods.html)