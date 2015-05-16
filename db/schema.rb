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

ActiveRecord::Schema.define(version: 20150516201315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.integer  "completion_xp"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "campaigns", ["course_id"], name: "index_campaigns_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.integer  "completion_xp"
    t.text     "description"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "title"
    t.integer  "xp_start"
    t.integer  "xp_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "title"
    t.text     "description"
    t.integer  "completion_xp"
    t.boolean  "required"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "missions", ["campaign_id"], name: "index_missions_on_campaign_id", using: :btree

  create_table "profile_levels", force: :cascade do |t|
    t.integer  "level_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_levels", ["level_id"], name: "index_profile_levels_on_level_id", using: :btree
  add_index "profile_levels", ["profile_id"], name: "index_profile_levels_on_profile_id", using: :btree

  create_table "profile_quests", force: :cascade do |t|
    t.integer  "status"
    t.integer  "profile_id"
    t.integer  "quest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_quests", ["profile_id"], name: "index_profile_quests_on_profile_id", using: :btree
  add_index "profile_quests", ["quest_id"], name: "index_profile_quests_on_quest_id", using: :btree

  create_table "profile_statuses", force: :cascade do |t|
    t.integer  "current_course"
    t.hstore   "current_campaigns"
    t.hstore   "current_missions"
    t.hstore   "completed"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profile_id"
    t.integer  "current_level"
  end

  add_index "profile_statuses", ["profile_id"], name: "index_profile_statuses_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "github"
    t.integer  "xp"
    t.string   "current_title"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.text     "bio"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "quests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "completion_xp"
    t.integer  "mission_id"
    t.boolean  "required"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "comparison_url"
    t.integer  "bonus_xp"
    t.float    "comparison_percentage"
  end

  add_index "quests", ["mission_id"], name: "index_quests_on_mission_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "campaigns", "courses"
  add_foreign_key "missions", "campaigns"
  add_foreign_key "profile_levels", "levels"
  add_foreign_key "profile_levels", "profiles"
  add_foreign_key "profile_quests", "profiles"
  add_foreign_key "profile_quests", "quests"
  add_foreign_key "profile_statuses", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "quests", "missions"
end
