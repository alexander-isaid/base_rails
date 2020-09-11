# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_08_175356) do

  create_table "empresa_pasarelas", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false
    t.integer "pasarela_id", precision: 38, null: false
    t.boolean "estado"
    t.string "username"
    t.string "llave"
    t.string "terminal_id"
    t.string "merchant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "i_empresa_pasarelas_empresa_id"
    t.index ["pasarela_id"], name: "i_emp_pas_pas_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nit"
    t.string "razon_social"
    t.string "nombre_comercial"
    t.string "direccion_comercial"
    t.string "email"
    t.string "usuario"
    t.string "telefono"
    t.string "usuario_api"
    t.string "llave_api"
    t.boolean "estado"
    t.boolean "eliminado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pasarelas", force: :cascade do |t|
    t.string "nombre"
    t.string "url_servicio"
    t.boolean "estado"
    t.boolean "eliminado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "descripcion"
    t.index ["name", "resource_type", "resource_id"], name: "i_rol_nam_res_typ_res_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "i_rol_res_typ_res_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", precision: 38, default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "empresa_id", precision: 38
    t.boolean "estado"
    t.boolean "eliminado"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["empresa_id"], name: "index_users_on_empresa_id"
    t.index ["reset_password_token"], name: "i_users_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "role_id", precision: 38
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "i_users_roles_user_id_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "empresa_pasarelas", "empresas"
  add_foreign_key "empresa_pasarelas", "pasarelas"
  add_foreign_key "users", "empresas"
end
