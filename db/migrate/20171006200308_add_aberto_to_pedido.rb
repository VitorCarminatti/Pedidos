class AddAbertoToPedido < ActiveRecord::Migration[5.1]
  def change
    add_column :pedidos, :aberto, :boolean, default: true
  end
end
