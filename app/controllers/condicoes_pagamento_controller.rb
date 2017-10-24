class CondicoesPagamentoController < ApplicationController
  before_action :set_condicao_pagamento, only: [:show, :edit, :update, :destroy]

  # GET /condicoes_pagamento
  # GET /condicoes_pagamento.json
  def index
    @condicoes_pagamento = CondicaoPagamento.all
  end

  # GET /condicoes_pagamento/1
  # GET /condicoes_pagamento/1.json
  def show
  end

  # GET /condicoes_pagamento/new
  def new
    @condicao_pagamento = CondicaoPagamento.new
  end

  # GET /condicoes_pagamento/1/edit
  def edit
  end

  # POST /condicoes_pagamento
  # POST /condicoes_pagamento.json
  def create
    @condicao_pagamento = CondicaoPagamento.new(condicao_pagamento_params)

    respond_to do |format|
      if @condicao_pagamento.save
        format.html { redirect_to @condicao_pagamento, notice: 'Condicao pagamento was successfully created.' }
        format.json { render :show, status: :created, location: @condicao_pagamento }
      else
        format.html { render :new }
        format.json { render json: @condicao_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condicoes_pagamento/1
  # PATCH/PUT /condicoes_pagamento/1.json
  def update
    respond_to do |format|
      if @condicao_pagamento.update(condicao_pagamento_params)
        format.html { redirect_to @condicao_pagamento, notice: 'Condicao pagamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @condicao_pagamento }
      else
        format.html { render :edit }
        format.json { render json: @condicao_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condicoes_pagamento/1
  # DELETE /condicoes_pagamento/1.json
  def destroy
    @condicao_pagamento.destroy
    respond_to do |format|
      format.html { redirect_to condicoes_pagamento_url, notice: 'Condicao pagamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condicao_pagamento
      @condicao_pagamento = CondicaoPagamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condicao_pagamento_params
      params.require(:condicao_pagamento).permit(:nome)
    end
end
