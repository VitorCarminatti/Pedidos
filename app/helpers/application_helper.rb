module ApplicationHelper

  def atualiza_quantidade_itens
    @itens_pedido = ItemPedido.joins(:pedido).where(Pedido.table_name => { user_id: current_user },
                                                    Pedido.table_name => { aberto: true }).size
  end

  def contador_itens
    ItemPedido.all.size
  end

  def limpa_carrinho
    Pedido.all.where(aberto: true).destroy_all
  end
end
