class RemoveAddressAttributeFromProvider < ActiveRecord::Migration[7.1]
  def change
    remove_column :providers, :address, :text
  end
end
