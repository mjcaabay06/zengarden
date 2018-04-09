# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180409075953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accesses", force: :cascade do |t|
    t.bigint "access_category_id"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_category_id"], name: "index_accesses_on_access_category_id"
  end

  create_table "aminities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.date "checked_in"
    t.date "checked_out"
    t.bigint "client_id"
    t.integer "guest"
    t.float "total_amount"
    t.bigint "booking_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["booking_status_id"], name: "index_bookings_on_booking_status_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "client_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email_address"
    t.string "contact_number"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_status_id"
    t.text "sid"
    t.index ["client_status_id"], name: "index_clients_on_client_status_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "client_id"
    t.date "event_date"
    t.bigint "event_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_id"
    t.index ["client_id"], name: "index_inquiries_on_client_id"
    t.index ["event_id"], name: "index_inquiries_on_event_id"
    t.index ["status_id"], name: "index_inquiries_on_status_id"
  end

  create_table "room_aminities", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "aminity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aminity_id"], name: "index_room_aminities_on_aminity_id"
    t.index ["room_id"], name: "index_room_aminities_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.integer "room_number"
    t.integer "accomodates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.text "url"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_role_accesses", force: :cascade do |t|
    t.bigint "access_id"
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_id"], name: "index_user_role_accesses_on_access_id"
    t.index ["user_role_id"], name: "index_user_role_accesses_on_user_role_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address"
    t.string "username"
    t.string "password"
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_id"
    t.index ["status_id"], name: "index_users_on_status_id"
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  add_foreign_key "accesses", "access_categories"
  add_foreign_key "bookings", "booking_statuses"
  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "clients", "client_statuses"
  add_foreign_key "inquiries", "clients"
  add_foreign_key "inquiries", "events"
  add_foreign_key "inquiries", "statuses"
  add_foreign_key "room_aminities", "aminities"
  add_foreign_key "room_aminities", "rooms"
  add_foreign_key "user_role_accesses", "accesses"
  add_foreign_key "user_role_accesses", "user_roles"
  add_foreign_key "users", "statuses"
  add_foreign_key "users", "user_roles"
end
