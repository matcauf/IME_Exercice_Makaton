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

ActiveRecord::Schema.define(:version => 20130704225656) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "describe_pictures", :force => true do |t|
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "describe_image_file_name"
    t.string   "describe_image_content_type"
    t.integer  "describe_image_file_size"
    t.datetime "describe_image_updated_at"
  end

  create_table "describisations", :force => true do |t|
    t.integer  "describe_picture_id"
    t.integer  "pictogramme_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "position"
  end

  add_index "describisations", ["describe_picture_id"], :name => "index_describisations_on_describe_picture_id"
  add_index "describisations", ["pictogramme_id"], :name => "index_describisations_on_pictogramme_id"

  create_table "galleries", :force => true do |t|
    t.integer  "category_id",    :null => false
    t.integer  "pictogramme_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "grammar_pictogrammes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "image_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "level_pictogrammes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "icon"
    t.integer  "position"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "pictogrammes", :force => true do |t|
    t.string   "name",                   :null => false
    t.integer  "grammar_pictogramme_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "sound_file_name"
    t.string   "sound_content_type"
    t.integer  "sound_file_size"
    t.datetime "sound_updated_at"
    t.string   "picto_file_name"
    t.string   "picto_content_type"
    t.integer  "picto_file_size"
    t.datetime "picto_updated_at"
    t.integer  "level_pictogramme_id",   :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "image_type_id",      :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "user_stats", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "user_id"
    t.integer  "total_three_dif_photo_photos",            :default => 0
    t.integer  "right_three_dif_photo_photos",            :default => 0
    t.integer  "total_three_dif_photo_drawings",          :default => 0
    t.integer  "right_three_dif_photo_drawings",          :default => 0
    t.integer  "total_three_dif_photo_pictogrammes",      :default => 0
    t.integer  "right_three_dif_photo_pictogrammes",      :default => 0
    t.integer  "total_three_dif_photo_words",             :default => 0
    t.integer  "right_three_dif_photo_words",             :default => 0
    t.integer  "total_three_id_photo_photos",             :default => 0
    t.integer  "right_three_id_photo_photos",             :default => 0
    t.integer  "total_three_id_drawing_drawings",         :default => 0
    t.integer  "right_three_id_drawing_drawings",         :default => 0
    t.integer  "total_three_id_pictogramme_pictogrammes", :default => 0
    t.integer  "right_three_id_pictogramme_pictogrammes", :default => 0
    t.integer  "total_two_dif_photo_photos",              :default => 0
    t.integer  "right_two_dif_photo_photos",              :default => 0
    t.integer  "total_two_dif_photo_drawings",            :default => 0
    t.integer  "right_two_dif_photo_drawings",            :default => 0
    t.integer  "total_two_dif_photo_pictogrammes",        :default => 0
    t.integer  "right_two_dif_photo_pictogrammes",        :default => 0
    t.integer  "total_two_id_photo_photos",               :default => 0
    t.integer  "right_two_id_photo_photos",               :default => 0
    t.integer  "total_two_id_drawing_drawings",           :default => 0
    t.integer  "right_two_id_drawing_drawings",           :default => 0
    t.integer  "total_two_id_pictogramme_pictogrammes",   :default => 0
    t.integer  "right_two_id_pictogramme_pictogrammes",   :default => 0
    t.integer  "total_two_dif_photo_words",               :default => 0
    t.integer  "right_two_dif_photo_words",               :default => 0
    t.integer  "total_two_white_photos",                  :default => 0
    t.integer  "right_two_white_photos",                  :default => 0
    t.integer  "total_two_white_drawings",                :default => 0
    t.integer  "right_two_white_drawings",                :default => 0
    t.integer  "total_two_white_pictogrammes",            :default => 0
    t.integer  "right_two_white_pictogrammes",            :default => 0
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "user_stats", ["gallery_id"], :name => "index_user_stats_on_gallery_id"
  add_index "user_stats", ["user_id"], :name => "index_user_stats_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => ""
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
