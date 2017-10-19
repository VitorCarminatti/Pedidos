module ItensPedidoHelper

  def totaliza_itens
    @itens_pedido.inject(0) { |sum, p| sum + p.val_total }
  end
end
