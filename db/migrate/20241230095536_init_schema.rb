# db/migrate/20241117000000_init_schema.rb
class InitSchema < ActiveRecord::Migration[7.0]
  def change

    create_table :active_storage_attachments, charset: "utf8mb3", force: :cascade do |t|
      t.string   :name,        null: false
      t.string   :record_type, null: false
      t.bigint   :record_id,   null: false
      t.bigint   :blob_id,     null: false
      t.datetime :created_at,  null: false
    end
    add_index :active_storage_attachments, :blob_id, name: "index_active_storage_attachments_on_blob_id"
    add_index :active_storage_attachments, [:record_type, :record_id, :name, :blob_id],
              name: "index_active_storage_attachments_uniqueness", unique: true

    create_table :active_storage_blobs, charset: "utf8mb3", force: :cascade do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum
      t.datetime :created_at,   null: false
    end
    add_index :active_storage_blobs, :key, name: "index_active_storage_blobs_on_key", unique: true

    create_table :active_storage_variant_records, charset: "utf8mb3", force: :cascade do |t|
      t.bigint  :blob_id,          null: false
      t.string  :variation_digest, null: false
    end
    add_index :active_storage_variant_records, [:blob_id, :variation_digest],
              name: "index_active_storage_variant_records_uniqueness", unique: true

    create_table :diaries, charset: "utf8mb3", force: :cascade do |t|
      t.string   :comment_text, null: false
      t.bigint   :pet_id,       null: false
      t.bigint   :room_id
      t.text     :image
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
      t.string   :text
    end
    add_index :diaries, :pet_id
    add_index :diaries, :room_id

    create_table :pets, charset: "utf8mb3", force: :cascade do |t|
      t.string   :pets_name,    null: false
      t.string   :kind,         null: false
      t.string   :sex_id,       null: false
      t.date     :birthday_id
      t.date     :family_day_id
      t.text     :image
      t.bigint   :user_id,      null: false
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
    end
    add_index :pets, :user_id

    create_table :questions, charset: "utf8mb3", force: :cascade do |t|
      t.text     :symptoms
      t.text     :progress
      t.string   :medicine
      t.string   :hospital
      t.string   :habit
      t.string   :favorite_food
      t.string   :favorite_place
      t.bigint   :pet_id,    null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.bigint   :user_id
    end
    add_index :questions, :pet_id
    add_index :questions, :user_id

    create_table :questions_answers, charset: "utf8mb3", force: :cascade do |t|
      t.integer  :user_id
      t.integer  :question_id
      t.text     :text
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :users, charset: "utf8mb3", force: :cascade do |t|
      t.string   :email,              default: "", null: false
      t.string   :encrypted_password, default: "", null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :created_at,         null: false
      t.datetime :updated_at,         null: false
      t.string   :nickname
    end
    add_index :users, :email, name: "index_users_on_email", unique: true
    add_index :users, :reset_password_token, name: "index_users_on_reset_password_token", unique: true

    # 外部キー制約
    add_foreign_key :active_storage_attachments, :active_storage_blobs, column: :blob_id
    add_foreign_key :active_storage_variant_records, :active_storage_blobs, column: :blob_id
    add_foreign_key :diaries, :pets
    add_foreign_key :pets, :users
    add_foreign_key :questions, :pets
    add_foreign_key :questions, :users
  end
end
