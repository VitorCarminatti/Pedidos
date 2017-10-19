class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.text :descricao
      t.boolean :ativo
      t.integer :estoque
      t.decimal :preco

      t.timestamps
    end
  end
end
