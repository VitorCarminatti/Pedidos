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

ActiveRecord::Schema.define(version: 20171006200308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "produto_id"
    t.index ["produto_id"], name: "index_categorias_on_produto_id"
  end

  create_table "itens_pedido", force: :cascade do |t|
    t.bigint "produto_id"
    t.bigint "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade"
    t.index ["pedido_id"], name: "index_itens_pedido_on_pedido_id"
    t.index ["produto_id"], name: "index_itens_pedido_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "aberto", default: true
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.text "descricao"
    t.boolean "ativo"
    t.integer "estoque"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.bigint "categoria_id"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "nome"
    t.string "endereco"
    t.string "fone"
    t.string "cpf"
    t.string "cidade"
    t.string "uf"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categorias", "produtos"
  add_foreign_key "itens_pedido", "pedidos"
  add_foreign_key "itens_pedido", "produtos"
  add_foreign_key "pedidos", "users"
  add_foreign_key "produtos", "categorias"
end
