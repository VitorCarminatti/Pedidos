class ItensPedidoController < ApplicationController

  before_action :set_item_pedido, only: [:destroy, :update]

  def index
    @itens_pedido = ItemPedido.joins(:pedido).where(Pedido.table_name => { user_id: current_user },
                                                    Pedido.table_name => { aberto: true })
  end

  def new
    @itens_pedido = ItemPedido.new
  end

  def update
    @item_pedido.assign_attributes(itens_pedido_params)
    if @item_pedido.save
      redirect_to itens_pedido_path, notice: "Quantidade atualizada com sucesso"
    else
      redirect_to itens_pedido_path, alert: "Houve um erro ao atualizar a quantidade"
    end
  end

  def destroy
    @item_pedido.destroy
    respond_to do |format|
      format.html { redirect_to itens_pedido_path, notice: 'Item removido com sucesso' }
      format.json { head :no_content }
    end
  end

  def esvazia_carrinho
    ItemPedido.destroy_all
    redirect_to itens_pedido_path, notice: 'Itens removidos com sucesso'
  end

  def aumenta_quantidade
    item_pedido = ItemPedido.find(params[:id])
    item_pedido.update!(quantidade: item_pedido.quantidade+1)
    @itens_pedido = ItemPedido.where(pedido: item_pedido.pedido).order(created_at: :asc)
  end

  def diminui_quantidade
    item_pedido = ItemPedido.find(params[:id])
    if item_pedido.quantidade > 1
    item_pedido.update!(quantidade: item_pedido.quantidade-1)
    end
    @itens_pedido = ItemPedido.where(pedido: item_pedido.pedido).order(created_at: :asc)
  end

  def set_item_pedido
    @item_pedido = ItemPedido.find(params[:id])
  end

  def itens_pedido_params
    params.require(:item_pedido).permit(:quantidade)
  end

end
