class AddInitialTables < ActiveRecord::Migration[6.0]
  def change
    create_table "import", id: false, force: :cascade do |t|
      t.text "name"
      t.text "summary"
      t.text "description"
      t.text "age_lower"
      t.text "age_upper"
      t.text "tags_require"
      t.text "tags_exclude"
      t.text "tags_features"
      t.text "address"
      t.text "postcode"
      t.text "wards"
      t.text "email"
      t.text "phone"
      t.text "website"
      t.text "hours"
      t.text "internal_external"
    end
  
    create_table "postcodes", id: false, force: :cascade do |t|
      t.text "postcode1"
      t.text "postcode2"
      t.text "postcode3"
      t.text "dateintroduced"
      t.integer "usertype"
      t.integer "easting"
      t.integer "northing"
      t.integer "positionalquality"
      t.text "countycode"
      t.text "countyname"
      t.text "localauthoritycode"
      t.text "localauthorityname"
      t.text "wardcode"
      t.text "wardname"
      t.text "countrycode"
      t.text "countryname"
      t.text "regioncode"
      t.text "regionname"
      t.text "parliamentaryconstituencycode"
      t.text "parliamentaryconstituencyname"
      t.text "europeanelectoralregioncode"
      t.text "europeanelectoralregionname"
      t.text "primarycaretrustcode"
      t.text "primarycaretrustname"
      t.text "lowersuperoutputareacode"
      t.text "lowersuperoutputareaname"
      t.text "middlesuperoutputareacode"
      t.text "middlesuperoutputareaname"
      t.text "outputareaclassificationcode"
      t.text "outputareaclassificationname"
      t.decimal "longitude"
      t.decimal "latitude"
      t.text "spatialaccuracy"
      t.text "lastuploaded"
      t.text "location"
      t.integer "socrataid"
      t.integer "lowerlayersuperoutputarea"
      t.integer "ward"
    end
  
    create_table "service_tags", primary_key: ["service_id", "tag_id"], force: :cascade do |t|
      t.integer "service_id", null: false
      t.integer "tag_id", null: false
      t.integer "required"
      t.integer "excluded"
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
    end
  
    create_table "sessions", force: :cascade do |t|
      t.string "session_id", null: false
      t.text "data"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
      t.index ["updated_at"], name: "index_sessions_on_updated_at"
    end
  
    create_table "tags", force: :cascade do |t|
      t.text "description"
      t.text "tag"
      t.integer "displayed"
    end
  
    add_foreign_key "service_tags", "services"
    add_foreign_key "service_tags", "tags"
  end
end
