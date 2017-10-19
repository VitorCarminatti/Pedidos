class CategoriaPolicy < ApplicationPolicy
	attr_reader :user, :categoria

	def intialize(user, categoria)
		@user = user
		@categoria = categoria
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
end
