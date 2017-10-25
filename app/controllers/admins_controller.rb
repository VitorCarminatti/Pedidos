class AdminsController < ApplicationController

  def index?
    authorize @admin
  end
end
