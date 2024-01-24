class AddAttributesToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :first_enrolled, :date, null: false
    add_column :clients, :street, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip, :string
    add_column :clients, :census_tract, :string
    add_column :clients, :qoz, :boolean
    add_column :clients, :date_of_birth, :date
    add_column :clients, :marital_status, :string
    add_column :clients, :monthly_salary, :decimal
    add_column :clients, :referring_partner, :string
    add_column :clients, :county_residence, :string
    add_column :clients, :county_work, :string
    add_column :clients, :employer, :string
    add_column :clients, :job_title, :string
  end
end
