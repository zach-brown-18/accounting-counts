class AddAttributesToProvider < ActiveRecord::Migration[7.1]
  def change
    add_column :providers, :street, :text
    add_column :providers, :city, :text
    add_column :providers, :state, :text
    add_column :providers, :zip, :text
    add_column :providers, :name, :text, null: false
  end
end
