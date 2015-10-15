# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151015072250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "lugar"
    t.string   "direccion"
    t.boolean  "espacio"
    t.text     "necesidades"
    t.text     "descripcion"
    t.string   "web"
    t.datetime "cuando"
    t.string   "imagen"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.time     "duracion"
    t.integer  "user_id"
  end

  add_index "eventos", ["user_id"], name: "index_eventos_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instructions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "lugar"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "comuna"
    t.string   "barrio"
    t.string   "categoria"
    t.string   "logo"
    t.string   "web"
    t.string   "imagen"
    t.text     "descripcion"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "eventos", "users"
end
