class AddDefaultAmountPaidToPayments < ActiveRecord::Migration[7.1]
  def change
    change_column :payments, :amount_paid, :decimal, default: 0.0
  end
end