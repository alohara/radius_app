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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131123002721) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "radius_name"
    t.integer  "group_id"
    t.string   "group_name"
    t.string   "group_desc"
    t.boolean  "active",      :default => false
    t.boolean  "admin",       :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "groups", ["group_id"], :name => "index_groups_on_group_id"
  add_index "groups", ["group_name"], :name => "index_groups_on_group_name"

  create_table "interests", :force => true do |t|
    t.string   "category"
    t.string   "category_desc"
    t.boolean  "active"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "reserved",      :default => false
  end

  create_table "radiusposts", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "interest_id"
    t.string   "interest"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "ip_address"
    t.string   "zipcode"
    t.boolean  "visible"
    t.integer  "group_id"
    t.string   "group_name"
    t.datetime "eff_timestamp"
    t.datetime "expires_in"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "radius_name"
    t.string   "city"
    t.string   "subcity"
  end

  add_index "radiusposts", ["city"], :name => "index_radiusposts_on_city"
  add_index "radiusposts", ["latitude", "longitude"], :name => "index_radiusposts_on_latitude_and_longitude"
  add_index "radiusposts", ["user_id", "created_at"], :name => "index_radiusposts_on_user_id_and_created_at"
  add_index "radiusposts", ["zipcode"], :name => "index_radiusposts_on_zipcode"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "default_zipcode"
    t.integer  "default_radius"
    t.string   "gender"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "security_one"
    t.string   "answer_one"
    t.string   "security_two"
    t.string   "answer_two"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "user_profiles", ["email"], :name => "index_user_profiles_on_email", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "radius_name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "business",        :default => false
    t.boolean  "active",          :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["radius_name"], :name => "index_users_on_radius_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
