class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para executar esta ação"
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :endereco, :fone, :cidade, :cpf, :uf])
    devise_parameter_sanitizer.permit(:account_update, keys: [:ativo, :nome, :endereco, :fone, :cidade, :cpf, :uf])
  end

  def disable_nav
    @disable_nav = true
  end
end
