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

ActiveRecord::Schema[7.0].define(version: 2023_10_28_200610) do
  create_table "books", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "title"
    t.string "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_books_on_person_id"
  end

  create_table "books_libraries", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_libraries_on_book_id"
    t.index ["library_id"], name: "index_books_libraries_on_library_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.string "coordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "county_id", null: false
    t.string "name"
    t.string "address"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_libraries_on_county_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.integer "phone"
    t.integer "library_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "people"
  add_foreign_key "books_libraries", "books"
  add_foreign_key "books_libraries", "libraries"
  add_foreign_key "libraries", "counties"
end
