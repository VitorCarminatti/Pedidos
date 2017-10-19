Rails.application.routes.draw do
  resources :categorias
  devise_for :users, controllers: { sessions: 'users/sessions', confirmations: 'users/confirmations' }, :path_prefix => 'my'
  resources :users
  resources :itens_pedido do
    patch :aumenta_quantidade, on: :member
    patch :diminui_quantidade, on: :member
    delete :esvazia_carrinho, on: :collection
  end
  resources :pedidos do
    get :atualiza_status_pedido, on: :collection
    get :pedidos_admin, on: :collection
    delete :destroy_pedido
  end
  resources :produtos do
    get :adiciona_produto, on: :collection
    get :produtos_admin, on: :collection
    delete :destroy_produto
  end
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'produtos#index'
end
