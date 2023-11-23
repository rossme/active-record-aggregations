# frozen_string_literal: true

module CustomerAggregations
  class Address < Base

    private

    def validate_attributes(record)
      [record.address.city.present? && record.address.street.present?, :address]
    end
  end
end
