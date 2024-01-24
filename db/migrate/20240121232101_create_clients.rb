class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_accepted
      t.boolean :is_active
      t.decimal :income
      t.decimal :amount_approved
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :child_name

      t.timestamps
    end
  end
end
