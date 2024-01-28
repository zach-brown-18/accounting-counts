class AddNotesAttributeToClient < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :notes, :string
  end
end
