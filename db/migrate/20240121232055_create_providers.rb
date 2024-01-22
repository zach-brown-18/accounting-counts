class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :primary_contact

      t.timestamps
    end
  end
end
