class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  accepts_nested_attributes_for :produto, reject_if: :all_blank, allow_destroy: true

    def val_total
        produto.preco * quantidade
    end
end
