class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pedidos
  # GET /pedidos.json
  def index
    @q = Pedido.ransack(params[:q])
    @pedidos = @q.result.includes(:user).paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  def pedidos_admin
    @q = Pedido.ransack(params[:q])
    @pedidos = @q.result.includes(:user).page(params[:page]).per(8)
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.user = current_user
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido criado com sucesso.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to itens_pedido_path, notice: 'Pedido atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    atualiza_estoque_cancelamento
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def destroy_pedido
    @pedido = Pedido.find(params[:pedido_id])
    atualiza_estoque_cancelamento
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_admin_pedidos_path, notice: 'Pedido removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def atualiza_estoque_venda
    pedido = Pedido.find_by(user_id: current_user, aberto: true)
    pedido.itens_pedido.each do |item|
      produto = pedido.produtos.find(item.produto_id)
      estoque = produto.estoque - item.quantidade
      produto.update(estoque: estoque)
    end
  end

  def atualiza_status_pedido
    pedido = Pedido.find_by(user_id: current_user, aberto: true)
    atualiza_estoque_venda
    pedido.update!(condicao_pagamento_id: params[:pedido][:condicao_pagamento_id], aberto: false )
    pedido.save!
    redirect_to pedidos_path
  end

  def atualiza_estoque_cancelamento
    pedido = Pedido.find_by(user_id: current_user, aberto: false)
    pedido.itens_pedido.each do |item|
      produto = pedido.produtos.find(item.produto_id)
      estoque = produto.estoque + item.quantidade
      produto.update(estoque: estoque)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:user_id, :condicao_pagamento_id,
        :itens_pedido_attributes => [:quantidade, %i[produto_id _destroy]])
    end
end
