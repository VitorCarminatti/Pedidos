class AdminPolicy < ApplicationPolicy
	attr_reader :user, :categoria

	def intialize(user, admin)
		@user = user
		@admin = admin
	end

	def update?
		user.admin?
	end

	def destroy?
		user.admin?
	end

	def new
		create?
	end

  def index?
    false
  end
end
