# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

# Clear existing clients, providers, and scholarships
Client.destroy_all
Provider.destroy_all
Scholarship.destroy_all
Payment.destroy_all

# Generate 25 clients with celebrity names
clients = []
25.times do
  client = Client.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    first_enrolled: Faker::Date.backward(days: 365),
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    census_tract: Faker::Address.building_number,
    qoz: Faker::Boolean.boolean,
    date_of_birth: Faker::Date.between(from: '1950-01-01', to: '2000-12-31'),
    marital_status: Faker::Demographic.marital_status,
    monthly_salary: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    referring_partner: Faker::Name.name,
    county_residence: Faker::Address.county,
    county_work: Faker::Address.county,
    employer: Faker::Company.name,
    job_title: Faker::Job.title,
    notes: Faker::Lorem.paragraph
  )
  clients << client
end

if clients.count == 25
  puts 'Clients created successfully!'
else
  puts "Clients encountered an issue. Created #{clients.count}/25"
end

# Generate 10 providers with dummy data
providers = []
10.times do
  provider = Provider.create!(
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    primary_contact: Faker::Name.name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    name: Faker::Company.name
  )
  providers << provider
end

if providers.count == 10
  puts 'Providers created successfully!'
else
  puts "Providers encountered an issue. Created #{providers.count}/10"
end


# Generate scholarships for each client, with three clients having three linked scholarships
scholarships = []
clients.each_with_index do |client, client_index|  
    provider = providers.sample
    scholarship = Scholarship.create!(
        year: [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017].sample,
        client_id: client.id,
        child_number: [1, 2, 3].sample,
        child_first_name: Faker::Name.first_name,
        child_last_name: Faker::Name.last_name,
        child_ethnicity: Faker::Demographic.race,
        child_birth_date: Faker::Date.between(from: '2010-01-01', to: '2015-12-31'),
        provider_id: provider.id,
        billing_cycle: ['Weekly', 'Monthly'].sample,
        cycle_tuition: Faker::Number.decimal(l_digits: 4, r_digits: 2),
        cycle_discount: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        cycle_state_voucher: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        cycle_parent_copay: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        start_date: Faker::Date.between(from: '2024-01-01', to: '2024-06-30'),
        end_date: Faker::Date.between(from: '2024-07-01', to: '2024-12-31'),
        length: [6, 9, 12].sample
    )
    scholarships << scholarship

    if client_index < 3
        2.times do |index|
            provider = providers.sample
            Scholarship.create!(
                year: [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017].sample,
                client_id: client.id,
                child_number: [1, 2, 3].sample,
                child_first_name: Faker::Name.first_name,
                child_last_name: Faker::Name.last_name,
                child_ethnicity: Faker::Demographic.race,
                child_birth_date: Faker::Date.between(from: '2010-01-01', to: '2015-12-31'),
                provider_id: provider.id,
                billing_cycle: ['Weekly', 'Monthly'].sample,
                cycle_tuition: Faker::Number.decimal(l_digits: 4, r_digits: 2),
                cycle_discount: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                cycle_state_voucher: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                cycle_parent_copay: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                start_date: Faker::Date.between(from: '2024-01-01', to: '2024-06-30'),
                end_date: Faker::Date.between(from: '2024-07-01', to: '2024-12-31'),
                length: [6, 9, 12].sample
            )
            scholarships << scholarship
          end
    end
  end
  
if scholarships.count == 31
  puts 'Scholarships created successfully!'
else
  puts "Scholarships encountered an issue. Created #{scholarships.count}/31"
end
