class AddNomeToProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :produtos, :nome, :string
  end
end
