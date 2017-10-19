json.extract! produto, :id, :descricao, :ativo, :estoque, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
