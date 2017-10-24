class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :disable_nav, only: [:index]
  before_action :authenticate_user!

  # GET /produtos
  # GET /produtos.json
  def index
    @q = Produto.ransack(params[:q])
    @produtos = @q.result(distinct: true).paginate(page: params[:page], per_page: 8)
  end

  def produtos_admin
    index
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def destroy_produto
    @produto = Produto.find(params[:produto_id])
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_admin_produtos_path, notice: 'Produto removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def adiciona_produto
    pedido = Pedido.find_by(user_id: current_user, aberto: true)
    if !pedido.present?
      pedido = Pedido.create!(user_id: current_user.id)
    end
    produto = pedido.itens_pedido.find_by(produto_id: params[:produto_id])
    if produto.present?
      produto.update!(quantidade: produto.quantidade+1)
      flash[:notice] = "Item adicionado com sucesso."
    else
      pedido.itens_pedido.create!(produto_id: params[:produto_id], quantidade: 1)
      flash[:notice] = "Item adicionado com sucesso."
    end
    index
  end

  def landing_page
    @disable_nav = true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :ativo, :estoque, :preco, :categoria_id, :foto)
    end

end
