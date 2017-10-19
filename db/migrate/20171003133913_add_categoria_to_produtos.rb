class AddCategoriaToProdutos < ActiveRecord::Migration[5.1]
  def change
    add_reference :produtos, :categoria, foreign_key: true
  end
end
