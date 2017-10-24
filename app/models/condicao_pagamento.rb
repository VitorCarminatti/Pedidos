class CondicaoPagamento < ApplicationRecord
  has_many :pedidos

  def to_s
      nome
  end
end
