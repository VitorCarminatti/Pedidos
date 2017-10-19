class ProdutoPolicy < ApplicationPolicy
	attr_reader :user, :produto

	def intialize(user, produto)
		@user = user
		@produto = produto
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