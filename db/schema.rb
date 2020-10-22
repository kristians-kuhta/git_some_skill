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

ActiveRecord::Schema.define(version: 2020_10_22_121745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repositories", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "description", limit: 255
    t.string "owner_login", limit: 255, null: false
    t.boolean "private", default: false
    t.string "html_url", limit: 2083, null: false
    t.string "clone_url", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clone_url"], name: "index_repositories_on_clone_url"
    t.index ["html_url"], name: "index_repositories_on_html_url"
    t.index ["name"], name: "index_repositories_on_name"
    t.index ["owner_login"], name: "index_repositories_on_owner_login"
  end

end
