class Categoria < ApplicationRecord
	has_many :produtos
	validates :nome, presence: true
	
	def to_s
  	nome
  end
end
