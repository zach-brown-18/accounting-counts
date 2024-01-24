class CreateScholarships < ActiveRecord::Migration[7.1]
  def change
    create_table :scholarships do |t|
      t.integer :year, null: false
      t.references :client, null: false, foreign_key: true
      t.integer :child_number, null: false
      t.string :child_first_name, null: false
      t.string :child_last_name, null: false
      t.string :child_ethnicity
      t.date :child_birth_date
      t.references :provider, null: false, foreign_key: true
      t.string :billing_cycle, null: false
      t.decimal :cycle_tuition
      t.decimal :cycle_discount
      t.decimal :cycle_state_voucher
      t.decimal :cycle_parent_copay
      t.date :start_date
      t.date :end_date
      t.integer :length

      t.timestamps
    end
  end
end
