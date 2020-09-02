# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_02_115151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "service_tags", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "tag_id", null: false
    t.boolean "required"
    t.boolean "excluded"
    t.index ["service_id"], name: "index_service_tags_on_service_id"
    t.index ["tag_id"], name: "index_service_tags_on_tag_id"
  end

  create_table "services", force: :cascade do |t|
    t.text "name"
    t.text "summary"
    t.text "description"
    t.text "age_lower"
    t.text "age_upper"
    t.text "address"
    t.text "postcode"
    t.text "wards"
    t.text "email"
    t.text "phone"
    t.text "website"
    t.text "hours"
    t.text "internal_external"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
  end

  create_table "tags", force: :cascade do |t|
    t.text "description"
    t.text "tag"
    t.integer "displayed"
  end

  add_foreign_key "service_tags", "services"
  add_foreign_key "service_tags", "tags"
end
