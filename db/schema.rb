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

ActiveRecord::Schema.define(version: 20160501133547) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "labs", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "name",                   default: "",   null: false
    t.text     "description",            default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_active",              default: true, null: false
  end

  add_index "labs", ["email"], name: "index_labs_on_email", unique: true
  add_index "labs", ["reset_password_token"], name: "index_labs_on_reset_password_token", unique: true

  create_table "result_attachments", force: :cascade do |t|
    t.integer  "result_id"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "type_of_tissue_id"
    t.integer  "type_of_examination_id"
    t.text     "description",            default: "", null: false
    t.text     "diagnosis",              default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "results", ["type_of_examination_id"], name: "index_results_on_type_of_examination_id"
  add_index "results", ["type_of_tissue_id"], name: "index_results_on_type_of_tissue_id"

  create_table "results_for_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "worker_id"
    t.integer  "result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "results_for_users", ["result_id"], name: "index_results_for_users_on_result_id"
  add_index "results_for_users", ["user_id"], name: "index_results_for_users_on_user_id"
  add_index "results_for_users", ["worker_id"], name: "index_results_for_users_on_worker_id"

  create_table "type_of_examinations", force: :cascade do |t|
    t.string   "examination", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_of_tissues", force: :cascade do |t|
    t.string   "tissue",      null: false
    t.string   "translation", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            default: "",   null: false
    t.string   "first_name",                       default: "",   null: false
    t.string   "last_name",                        default: "",   null: false
    t.string   "identifier",                       default: "",   null: false
    t.string   "encrypted_password",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "sex",                    limit: 1
    t.boolean  "is_active",                        default: true, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workers", force: :cascade do |t|
    t.integer  "lab_id"
    t.string   "email",                            default: "",   null: false
    t.string   "first_name",                       default: "",   null: false
    t.string   "last_name",                        default: "",   null: false
    t.string   "identifier",                       default: "",   null: false
    t.string   "encrypted_password",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "sex",                    limit: 1
    t.boolean  "is_active",                        default: true, null: false
  end

  add_index "workers", ["email"], name: "index_workers_on_email", unique: true
  add_index "workers", ["lab_id"], name: "index_workers_on_lab_id"
  add_index "workers", ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true

end
