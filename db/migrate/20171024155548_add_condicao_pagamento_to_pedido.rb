class AddCondicaoPagamentoToPedido < ActiveRecord::Migration[5.1]
  def change
    add_reference :pedidos, :condicao_pagamento, foreign_key: true
  end
end
