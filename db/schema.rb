
ActiveRecord::Schema.define(version: 20200224064837) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "src"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "installs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_installs_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true, using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "prefecture",                    null: false
    t.text     "description",     limit: 65535, null: false
    t.integer  "condition_id",                  null: false
    t.integer  "delivery_day_id",               null: false
    t.integer  "brand_id",                      null: false
    t.integer  "likes_count",                   null: false
    t.integer  "user_id",                       null: false
    t.integer  "category_id",                   null: false
    t.integer  "item_state_id",                 null: false
    t.integer  "postage_id",                    null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["item_state_id"], name: "index_items_on_item_state_id", using: :btree
    t.index ["postage_id"], name: "index_items_on_postage_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "nickname",        null: false
    t.string  "email",           null: false
    t.string  "password",        null: false
    t.string  "first_name",      null: false
    t.string  "last_name",       null: false
    t.string  "first_name_kana", null: false
    t.string  "last_name_kana",  null: false
    t.integer "tel",             null: false
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["password"], name: "index_users_on_password", unique: true, using: :btree
    t.index ["tel"], name: "index_users_on_tel", unique: true, using: :btree
  end

  add_foreign_key "images", "items"
end
