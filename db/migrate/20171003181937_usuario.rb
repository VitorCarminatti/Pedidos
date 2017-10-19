class Usuario < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :nome, :string
  	add_column :users, :endereço, :string
  	add_column :users, :fone, :string
  	add_column :users, :cpf, :string
  	add_column :users, :cidade, :string
  	add_column :users, :uf, :string
  end
end
