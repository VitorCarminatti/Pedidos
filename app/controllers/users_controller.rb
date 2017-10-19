class UsersController < ApplicationController

  before_action :set_user, only: [:destroy, :edit, :update]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    if @user.destroy
        redirect_to users_path, notice: "Usuário removido com sucesso."
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário alterado com sucesso."
    else
      render 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :admin, :nome, :endereco, :fone, :cidade, :cpf, :uf)
    end

end
