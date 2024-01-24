# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_24_033426) do
  create_table "clients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "first_enrolled", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "census_tract"
    t.boolean "qoz"
    t.date "date_of_birth"
    t.string "marital_status"
    t.decimal "monthly_salary"
    t.string "referring_partner"
    t.string "county_residence"
    t.string "county_work"
    t.string "employer"
    t.string "job_title"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scholarship_id", null: false
    t.integer "client_id", null: false
    t.integer "payment_number"
    t.date "week_end_date"
    t.string "month_name"
    t.decimal "amount_due"
    t.decimal "amount_paid"
    t.date "date_paid"
    t.string "reference"
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["scholarship_id"], name: "index_payments_on_scholarship_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "primary_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "street"
    t.text "city"
    t.text "state"
    t.text "zip"
    t.text "name", null: false
  end

  create_table "scholarships", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "client_id", null: false
    t.integer "child_number", null: false
    t.string "child_first_name", null: false
    t.string "child_last_name", null: false
    t.string "child_ethnicity"
    t.date "child_birth_date"
    t.integer "provider_id", null: false
    t.string "billing_cycle", null: false
    t.decimal "cycle_tuition"
    t.decimal "cycle_discount"
    t.decimal "cycle_state_voucher"
    t.decimal "cycle_parent_copay"
    t.date "start_date"
    t.date "end_date"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_scholarships_on_client_id"
    t.index ["provider_id"], name: "index_scholarships_on_provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "scholarships"
  add_foreign_key "scholarships", "clients"
  add_foreign_key "scholarships", "providers"
end
