class Categoria < ApplicationRecord
	has_many :produtos
	
	def to_s
  		nome
  	end
end
