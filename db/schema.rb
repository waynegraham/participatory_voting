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

ActiveRecord::Schema.define(version: 20160512143500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjustments", force: :cascade do |t|
    t.integer  "agenda_id"
    t.integer  "user_id"
    t.boolean  "presence",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "deleted_at"
  end

  add_index "adjustments", ["agenda_id"], name: "index_adjustments_on_agenda_id", using: :btree
  add_index "adjustments", ["deleted_at"], name: "index_adjustments_on_deleted_at", using: :btree
  add_index "adjustments", ["user_id"], name: "index_adjustments_on_user_id", using: :btree

  create_table "agendas", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "index",      default: 1
    t.string   "sort_index"
    t.string   "title"
    t.string   "status",     default: "future", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "deleted_at"
  end

  add_index "agendas", ["deleted_at"], name: "index_agendas_on_deleted_at", using: :btree
  add_index "agendas", ["parent_id"], name: "index_agendas_on_parent_id", using: :btree

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.integer  "updater_id"
    t.integer  "vote_id"
    t.json     "audited_changes", default: {}, null: false
    t.string   "action"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "audits", ["auditable_type", "auditable_id"], name: "index_audits_on_auditable_type_and_auditable_id", using: :btree
  add_index "audits", ["updater_id"], name: "index_audits_on_updater_id", using: :btree
  add_index "audits", ["user_id"], name: "index_audits_on_user_id", using: :btree
  add_index "audits", ["vote_id"], name: "index_audits_on_vote_id", using: :btree

  create_table "constants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "pdf_file_name",    limit: 255
    t.string   "pdf_content_type", limit: 255
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "title",            limit: 255
    t.boolean  "public"
    t.string   "category",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.string   "question",      limit: 255
    t.text     "answer"
    t.integer  "sorting_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",      limit: 255
  end

  add_index "faqs", ["category"], name: "index_faqs_on_category", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "location",   limit: 255
    t.integer  "index"
    t.string   "link",       limit: 255
    t.string   "name",       limit: 255
    t.boolean  "visible"
    t.boolean  "turbolinks",             default: true
    t.boolean  "blank_p"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "url"
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.boolean  "public"
    t.date     "d_publish"
    t.date     "d_remove"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permission_users", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "permission_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "permission_users", ["permission_id"], name: "index_permission_users_on_permission_id", using: :btree
  add_index "permission_users", ["user_id"], name: "index_permission_users_on_user_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "subject_class", limit: 255
    t.string   "action",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "author"
    t.text     "abstract"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "title"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "contribution_type"
    t.string   "contribution_format"
  end

  add_index "proposals", ["cached_votes_down"], name: "index_proposals_on_cached_votes_down", using: :btree
  add_index "proposals", ["cached_votes_score"], name: "index_proposals_on_cached_votes_score", using: :btree
  add_index "proposals", ["cached_votes_total"], name: "index_proposals_on_cached_votes_total", using: :btree
  add_index "proposals", ["cached_votes_up"], name: "index_proposals_on_cached_votes_up", using: :btree
  add_index "proposals", ["cached_weighted_average"], name: "index_proposals_on_cached_weighted_average", using: :btree
  add_index "proposals", ["cached_weighted_score"], name: "index_proposals_on_cached_weighted_score", using: :btree
  add_index "proposals", ["cached_weighted_total"], name: "index_proposals_on_cached_weighted_total", using: :btree
  add_index "proposals", ["title"], name: "index_proposals_on_title", using: :btree

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_options", force: :cascade do |t|
    t.string   "title"
    t.integer  "count",      default: 0
    t.integer  "vote_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
  end

  add_index "vote_options", ["deleted_at"], name: "index_vote_options_on_deleted_at", using: :btree
  add_index "vote_options", ["vote_id"], name: "index_vote_options_on_vote_id", using: :btree

  create_table "vote_posts", force: :cascade do |t|
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer  "user_id"
  end

  add_index "vote_posts", ["deleted_at"], name: "index_vote_posts_on_deleted_at", using: :btree
  add_index "vote_posts", ["user_id"], name: "index_vote_posts_on_user_id", using: :btree
  add_index "vote_posts", ["vote_id"], name: "index_vote_posts_on_vote_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "adjustments", "agendas"
end
