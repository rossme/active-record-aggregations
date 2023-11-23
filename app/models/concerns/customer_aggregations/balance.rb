# frozen_string_literal: true

module CustomerAggregations
  class Balance < Base

    private

    def validate_attributes(record)
      [record.balance.amount.present?, :balance]
    end
  end
end
