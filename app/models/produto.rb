class Produto < ApplicationRecord
	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/	
	
	has_many :itens_pedido, class_name: "ItemPedido", dependent: :destroy
	has_many :pedidos, through: :itens_pedido, source: :pedido
	belongs_to :categoria

	def self.ransackable_scopes(_auth_object = nil)
		[:by_categoria]
	end

	def self.by_categoria(dados)
		Produto.joins(:categoria).where(Categoria.table_name => {nome: dados})
	end

  def to_s
  	nome
  end
  
end
