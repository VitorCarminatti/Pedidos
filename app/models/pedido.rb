class Pedido < ApplicationRecord
	belongs_to :user
	belongs_to :condicao_pagamento, optional: true
 	has_many :itens_pedido, class_name: "ItemPedido", dependent: :destroy
	has_many :produtos, through: :itens_pedido, source: :produto

  	accepts_nested_attributes_for :itens_pedido, reject_if: :all_blank, allow_destroy: true

  	def soma_pedido
			itens_pedido.inject(0) { |sum, p| sum + p.val_total }
		end
end
