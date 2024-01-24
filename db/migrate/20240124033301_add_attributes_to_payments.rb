class AddAttributesToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :scholarship, null: false, foreign_key: true
    add_reference :payments, :client, null: false, foreign_key: true
    add_column :payments, :payment_number, :integer
    add_column :payments, :week_end_date, :date
    add_column :payments, :month_name, :string
    add_column :payments, :amount_due, :decimal
    add_column :payments, :amount_paid, :decimal
    add_column :payments, :date_paid, :date
    add_column :payments, :reference, :string
  end
end
