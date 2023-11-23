# frozen_string_literal: true

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
