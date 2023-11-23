# frozen_string_literal: true

class Address
  attr_reader :street, :city

  def initialize(street, city)
    @street = street
    @city = city
  end

  def close_to?(other_address)
    city == other_address.city
  end

  def ==(other)
    city == other.city && street == other.street
  end
end
