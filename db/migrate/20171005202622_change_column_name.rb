class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
	rename_column :users, :endereço, :endereco
  end
end