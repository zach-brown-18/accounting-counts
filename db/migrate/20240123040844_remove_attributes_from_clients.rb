class RemoveAttributesFromClients < ActiveRecord::Migration[7.1]
  def change
    remove_column :clients, :date_accepted, :date
    remove_column :clients, :is_active, :boolean
    remove_column :clients, :income, :decimal
    remove_column :clients, :amount_approved, :decimal
    remove_column :clients, :address, :string
    remove_column :clients, :child_name, :string
  end
end
