class AddQuantidadeToItemPedido < ActiveRecord::Migration[5.1]
  def change
    add_column :itens_pedido, :quantidade, :integer
  end
end
