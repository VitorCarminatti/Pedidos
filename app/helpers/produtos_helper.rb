module ProdutosHelper
	def categorias_for_select
		Categoria.all.collect(&:nome)
	end
end
