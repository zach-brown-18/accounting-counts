class RemoveAttributesFromPayments < ActiveRecord::Migration[7.1]
  def change
    remove_column :payments, :amount, :decimal
    remove_column :payments, :date, :date
  end
end
