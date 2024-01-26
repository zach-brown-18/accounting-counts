class Payment < ApplicationRecord
    belongs_to :scholarship

    def remaining_balance(cycle_ccc_pay)
        return cycle_ccc_pay - amount_paid unless cycle_ccc_pay.nil? or amount_paid.nil?
        0
    end
end
