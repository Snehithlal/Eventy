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

ActiveRecord::Schema[7.0].define(version: 2022_01_13_124609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', precision: nil, null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index ['record_type', 'record_id', 'name', 'blob_id'], name: 'index_active_storage_attachments_uniqueness',
unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', precision: nil, null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index ['blob_id', 'variation_digest'], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'circles', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.bigint 'head_id', null: false
    t.text 'member_ids', default: [], array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['head_id'], name: 'index_circles_on_head_id'
    t.index ['member_ids'], name: 'index_circles_on_member_ids', using: :gin
  end

  create_table 'events', force: :cascade do |t|
    t.integer 'host_id'
    t.string 'title'
    t.text 'description'
    t.string 'place'
    t.datetime 'start_time', precision: nil
    t.datetime 'end_time', precision: nil
    t.text 'review'
    t.boolean 'chat_enabled', default: false
    t.boolean 'quick_event', default: false
    t.boolean 'completed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'circle_id'
    t.index ['circle_id'], name: 'index_on_circle'
    t.index ['host_id'], name: 'index_events_on_host_id'
    t.index ['start_time', 'end_time'], name: 'index_events_on_start_time_and_end_time'
  end

  create_table 'user_events', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'user_id'
    t.integer 'priority'
    t.integer 'event_role', default: 0
    t.datetime 'reminder_time', precision: nil
    t.boolean 'reminder_enabled', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_user_events_on_event_id'
    t.index ['event_role'], name: 'index_user_events_on_event_role'
    t.index ['user_id', 'priority'], name: 'index_user_events_on_user_id_and_priority'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'user_name'
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name'
    t.string 'email'
    t.boolean 'admin', default: false
    t.string 'phone_no'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'circles', 'users', column: 'head_id'
end
