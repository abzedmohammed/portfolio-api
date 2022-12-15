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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_113816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_emailaddress", id: :serial, force: :cascade do |t|
    t.string "email", limit: 254, null: false
    t.boolean "verified", null: false
    t.boolean "primary", null: false
    t.bigint "user_id", null: false
    t.index ["email"], name: "account_emailaddress_email_03be32b2_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "account_emailaddress_email_key", unique: true
    t.index ["user_id"], name: "account_emailaddress_user_id_2c513194"
  end

  create_table "account_emailconfirmation", id: :serial, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "sent"
    t.string "key", limit: 64, null: false
    t.integer "email_address_id", null: false
    t.index ["email_address_id"], name: "account_emailconfirmation_email_address_id_5b7f8c58"
    t.index ["key"], name: "account_emailconfirmation_key_f43612bd_like", opclass: :varchar_pattern_ops
    t.index ["key"], name: "account_emailconfirmation_key_key", unique: true
  end

  create_table "api_classroom", force: :cascade do |t|
    t.uuid "instructor_id"
    t.string "class_name", limit: 50
    t.index ["instructor_id"], name: "api_classroom_instructor_id_3ea23450"
  end

  create_table "api_classroom_student", force: :cascade do |t|
    t.bigint "classroom_id", null: false
    t.uuid "student_id", null: false
    t.index ["classroom_id", "student_id"], name: "api_classroom_student_classroom_id_student_id_cf1f79ab_uniq", unique: true
    t.index ["classroom_id"], name: "api_classroom_student_classroom_id_42358077"
    t.index ["student_id"], name: "api_classroom_student_student_id_8a7f30b1"
  end

  create_table "api_mentor", primary_key: "uuid", id: :uuid, default: nil, force: :cascade do |t|
    t.string "stack", limit: 55, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "api_mentor_account_id_key", unique: true
  end

  create_table "api_student", primary_key: "uuid", id: :uuid, default: nil, force: :cascade do |t|
    t.string "location", limit: 55, null: false
    t.timestamptz "joined_on", null: false
    t.string "stack", limit: 55, null: false
    t.integer "payment"
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "api_student_account_id_key", unique: true
  end

  create_table "api_systemuser", force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.string "username", limit: 19
    t.integer "phone_number"
    t.string "avatar", limit: 255, null: false
    t.string "gender", limit: 55
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 50, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_superuser", null: false
    t.boolean "is_admin", null: false
    t.boolean "is_active", null: false
    t.index ["email"], name: "api_systemuser_email_bf6d8e31_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "api_systemuser_email_key", unique: true
    t.index ["username"], name: "api_systemuser_username_9338f12a_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "api_systemuser_username_key", unique: true
  end

  create_table "api_systemuser_groups", force: :cascade do |t|
    t.bigint "systemuser_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "api_systemuser_groups_group_id_06ee1374"
    t.index ["systemuser_id", "group_id"], name: "api_systemuser_groups_systemuser_id_group_id_d4c4a50e_uniq", unique: true
    t.index ["systemuser_id"], name: "api_systemuser_groups_systemuser_id_1500fb54"
  end

  create_table "api_systemuser_user_permissions", force: :cascade do |t|
    t.bigint "systemuser_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "api_systemuser_user_permissions_permission_id_1cbd4bd8"
    t.index ["systemuser_id", "permission_id"], name: "api_systemuser_user_perm_systemuser_id_permission_1aa10d38_uniq", unique: true
    t.index ["systemuser_id"], name: "api_systemuser_user_permissions_systemuser_id_299b368d"
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "authtoken_token", primary_key: "key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.bigint "user_id", null: false
    t.index ["key"], name: "authtoken_token_key_10f0b77e_like", opclass: :varchar_pattern_ops
    t.index ["user_id"], name: "authtoken_token_user_id_key", unique: true
  end

  create_table "bnb_rooms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "bnb_type"
    t.integer "price"
    t.string "bnb_image"
    t.text "features"
    t.integer "bed"
    t.integer "size"
    t.boolean "wifi"
    t.boolean "electronics"
    t.boolean "booked"
    t.bigint "bnb_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bnb_user_id"], name: "index_bnb_rooms_on_bnb_user_id"
  end

  create_table "bnb_users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "username"
    t.string "avatar"
    t.string "password_digest"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.bigint "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "django_site", id: :serial, force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name", limit: 50, null: false
    t.index ["domain"], name: "django_site_domain_a2e37b91_like", opclass: :varchar_pattern_ops
    t.index ["domain"], name: "django_site_domain_a2e37b91_uniq", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "picture"
    t.string "date"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "socialaccount_socialaccount", id: :serial, force: :cascade do |t|
    t.string "provider", limit: 30, null: false
    t.string "uid", limit: 191, null: false
    t.timestamptz "last_login", null: false
    t.timestamptz "date_joined", null: false
    t.text "extra_data", null: false
    t.bigint "user_id", null: false
    t.index ["provider", "uid"], name: "socialaccount_socialaccount_provider_uid_fc810c6e_uniq", unique: true
    t.index ["user_id"], name: "socialaccount_socialaccount_user_id_8146e70c"
  end

  create_table "socialaccount_socialapp", id: :serial, force: :cascade do |t|
    t.string "provider", limit: 30, null: false
    t.string "name", limit: 40, null: false
    t.string "client_id", limit: 191, null: false
    t.string "secret", limit: 191, null: false
    t.string "key", limit: 191, null: false
  end

  create_table "socialaccount_socialapp_sites", force: :cascade do |t|
    t.integer "socialapp_id", null: false
    t.integer "site_id", null: false
    t.index ["site_id"], name: "socialaccount_socialapp_sites_site_id_2579dee5"
    t.index ["socialapp_id", "site_id"], name: "socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq", unique: true
    t.index ["socialapp_id"], name: "socialaccount_socialapp_sites_socialapp_id_97fb6e7d"
  end

  create_table "socialaccount_socialtoken", id: :serial, force: :cascade do |t|
    t.text "token", null: false
    t.text "token_secret", null: false
    t.timestamptz "expires_at"
    t.integer "account_id", null: false
    t.integer "app_id", null: false
    t.index ["account_id"], name: "socialaccount_socialtoken_account_id_951f210e"
    t.index ["app_id", "account_id"], name: "socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq", unique: true
    t.index ["app_id"], name: "socialaccount_socialtoken_app_id_636a42d7"
  end

  create_table "soko_buyer", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.index ["buyer_id"], name: "soko_buyer_buyer_id_key", unique: true
  end

  create_table "soko_category", id: :serial, force: :cascade do |t|
    t.string "category", limit: 100
  end

  create_table "soko_customuser", force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.string "phone_number", limit: 19
    t.string "avatar", limit: 255, null: false
    t.string "gender", limit: 55
    t.text "bio"
    t.boolean "is_seller", null: false
    t.boolean "is_buyer", null: false
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 50, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_superuser", null: false
    t.boolean "is_admin", null: false
    t.boolean "is_active", null: false
    t.index ["email"], name: "soko_customuser_email_062f6557_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "soko_customuser_email_key", unique: true
  end

  create_table "soko_customuser_groups", force: :cascade do |t|
    t.bigint "customuser_id", null: false
    t.integer "group_id", null: false
    t.index ["customuser_id", "group_id"], name: "soko_customuser_groups_customuser_id_group_id_1ba2371e_uniq", unique: true
    t.index ["customuser_id"], name: "soko_customuser_groups_customuser_id_52889431"
    t.index ["group_id"], name: "soko_customuser_groups_group_id_a8ba072e"
  end

  create_table "soko_customuser_user_permissions", force: :cascade do |t|
    t.bigint "customuser_id", null: false
    t.integer "permission_id", null: false
    t.index ["customuser_id", "permission_id"], name: "soko_customuser_user_per_customuser_id_permission_1938e72d_uniq", unique: true
    t.index ["customuser_id"], name: "soko_customuser_user_permissions_customuser_id_4bad1242"
    t.index ["permission_id"], name: "soko_customuser_user_permissions_permission_id_05827d23"
  end

  create_table "soko_picture", force: :cascade do |t|
    t.string "images", limit: 100
  end

  create_table "soko_product", primary_key: "uuid", id: :uuid, default: nil, force: :cascade do |t|
    t.string "title", limit: 200
    t.string "color", limit: 200
    t.string "material", limit: 200
    t.string "images", limit: 255, null: false
    t.text "description"
    t.integer "price"
    t.string "location", limit: 200
    t.string "precise_location", limit: 200
    t.string "type", limit: 55
    t.string "condition", limit: 55
    t.integer "view", null: false
    t.boolean "negotiatable", null: false
    t.boolean "agreement", null: false
    t.boolean "featured", null: false
    t.boolean "live", null: false
    t.boolean "expired", null: false
    t.boolean "sold", null: false
    t.timestamptz "date", null: false
    t.integer "category_id"
    t.integer "sub_category_id"
    t.bigint "user_id", null: false
    t.index ["category_id"], name: "soko_product_category_id_99791736"
    t.index ["sub_category_id"], name: "soko_product_sub_category_id_d3e5735f"
    t.index ["user_id"], name: "soko_product_user_id_f4c06956"
  end

  create_table "soko_productimage", force: :cascade do |t|
    t.string "other_images", limit: 255, null: false
    t.uuid "product_id"
    t.index ["product_id"], name: "soko_productimage_product_id_9310ba09"
  end

  create_table "soko_review", force: :cascade do |t|
    t.string "title", limit: 200
    t.text "description"
    t.integer "rating", null: false
    t.boolean "purchased", null: false
    t.timestamptz "date", null: false
    t.uuid "product_id", null: false
    t.bigint "user_id", null: false
    t.index ["product_id"], name: "soko_review_product_id_203d2339"
    t.index ["user_id"], name: "soko_review_user_id_ed10b099"
  end

  create_table "soko_seller", force: :cascade do |t|
    t.string "business_name", limit: 150, null: false
    t.string "location", limit: 55
    t.string "precise_location", limit: 55
    t.string "youtube", limit: 250, null: false
    t.string "facebook", limit: 250, null: false
    t.string "linkedin", limit: 250, null: false
    t.string "twitter", limit: 250, null: false
    t.string "instagram", limit: 250, null: false
    t.string "website", limit: 250, null: false
    t.bigint "seller_id"
    t.index ["seller_id"], name: "soko_seller_seller_id_key", unique: true
  end

  create_table "soko_subcategory", id: :serial, force: :cascade do |t|
    t.string "subcategory", limit: 100
    t.integer "category_id"
    t.index ["category_id"], name: "soko_subcategory_category_id_8e8e4752"
  end

  create_table "soko_wishlist", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.uuid "wished_item_id", null: false
    t.index ["user_id"], name: "soko_wishlist_user_id_ed462ab2"
    t.index ["wished_item_id"], name: "soko_wishlist_wished_item_id_4a65efe8"
  end

  add_foreign_key "account_emailaddress", "soko_customuser", column: "user_id", name: "account_emailaddress_user_id_2c513194_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "account_emailconfirmation", "account_emailaddress", column: "email_address_id", name: "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e", deferrable: :deferred
  add_foreign_key "api_classroom", "api_mentor", column: "instructor_id", primary_key: "uuid", name: "api_classroom_instructor_id_3ea23450_fk_api_mentor_uuid", deferrable: :deferred
  add_foreign_key "api_classroom_student", "api_classroom", column: "classroom_id", name: "api_classroom_student_classroom_id_42358077_fk_api_classroom_id", deferrable: :deferred
  add_foreign_key "api_classroom_student", "api_student", column: "student_id", primary_key: "uuid", name: "api_classroom_student_student_id_8a7f30b1_fk_api_student_uuid", deferrable: :deferred
  add_foreign_key "api_mentor", "api_systemuser", column: "account_id", name: "api_mentor_account_id_c0b096d2_fk_api_systemuser_id", deferrable: :deferred
  add_foreign_key "api_student", "api_systemuser", column: "account_id", name: "api_student_account_id_5bf4338f_fk_api_systemuser_id", deferrable: :deferred
  add_foreign_key "api_systemuser_groups", "api_systemuser", column: "systemuser_id", name: "api_systemuser_group_systemuser_id_1500fb54_fk_api_syste", deferrable: :deferred
  add_foreign_key "api_systemuser_groups", "auth_group", column: "group_id", name: "api_systemuser_groups_group_id_06ee1374_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "api_systemuser_user_permissions", "api_systemuser", column: "systemuser_id", name: "api_systemuser_user__systemuser_id_299b368d_fk_api_syste", deferrable: :deferred
  add_foreign_key "api_systemuser_user_permissions", "auth_permission", column: "permission_id", name: "api_systemuser_user__permission_id_1cbd4bd8_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "authtoken_token", "api_systemuser", column: "user_id", name: "authtoken_token_user_id_35299eff_fk_api_systemuser_id", deferrable: :deferred
  add_foreign_key "bnb_rooms", "bnb_users"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "django_admin_log", "soko_customuser", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "socialaccount_socialaccount", "soko_customuser", column: "user_id", name: "socialaccount_social_user_id_8146e70c_fk_soko_cust", deferrable: :deferred
  add_foreign_key "socialaccount_socialapp_sites", "django_site", column: "site_id", name: "socialaccount_social_site_id_2579dee5_fk_django_si", deferrable: :deferred
  add_foreign_key "socialaccount_socialapp_sites", "socialaccount_socialapp", column: "socialapp_id", name: "socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc", deferrable: :deferred
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialaccount", column: "account_id", name: "socialaccount_social_account_id_951f210e_fk_socialacc", deferrable: :deferred
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialapp", column: "app_id", name: "socialaccount_social_app_id_636a42d7_fk_socialacc", deferrable: :deferred
  add_foreign_key "soko_buyer", "soko_customuser", column: "buyer_id", name: "soko_buyer_buyer_id_e4848f67_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "soko_customuser_groups", "auth_group", column: "group_id", name: "soko_customuser_groups_group_id_a8ba072e_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "soko_customuser_groups", "soko_customuser", column: "customuser_id", name: "soko_customuser_grou_customuser_id_52889431_fk_soko_cust", deferrable: :deferred
  add_foreign_key "soko_customuser_user_permissions", "auth_permission", column: "permission_id", name: "soko_customuser_user_permission_id_05827d23_fk_auth_perm", deferrable: :deferred
  add_foreign_key "soko_customuser_user_permissions", "soko_customuser", column: "customuser_id", name: "soko_customuser_user_customuser_id_4bad1242_fk_soko_cust", deferrable: :deferred
  add_foreign_key "soko_product", "soko_category", column: "category_id", name: "soko_product_category_id_99791736_fk_soko_category_id", deferrable: :deferred
  add_foreign_key "soko_product", "soko_seller", column: "user_id", name: "soko_product_user_id_f4c06956_fk_soko_seller_id", deferrable: :deferred
  add_foreign_key "soko_product", "soko_subcategory", column: "sub_category_id", name: "soko_product_sub_category_id_d3e5735f_fk_soko_subcategory_id", deferrable: :deferred
  add_foreign_key "soko_productimage", "soko_product", column: "product_id", primary_key: "uuid", name: "soko_productimage_product_id_9310ba09_fk_soko_product_uuid", deferrable: :deferred
  add_foreign_key "soko_review", "soko_customuser", column: "user_id", name: "soko_review_user_id_ed10b099_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "soko_review", "soko_product", column: "product_id", primary_key: "uuid", name: "soko_review_product_id_203d2339_fk_soko_product_uuid", deferrable: :deferred
  add_foreign_key "soko_seller", "soko_customuser", column: "seller_id", name: "soko_seller_seller_id_4c98460f_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "soko_subcategory", "soko_category", column: "category_id", name: "soko_subcategory_category_id_8e8e4752_fk_soko_category_id", deferrable: :deferred
  add_foreign_key "soko_wishlist", "soko_customuser", column: "user_id", name: "soko_wishlist_user_id_ed462ab2_fk_soko_customuser_id", deferrable: :deferred
  add_foreign_key "soko_wishlist", "soko_product", column: "wished_item_id", primary_key: "uuid", name: "soko_wishlist_wished_item_id_4a65efe8_fk_soko_product_uuid", deferrable: :deferred
end
