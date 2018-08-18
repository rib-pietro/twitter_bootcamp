class UsersController < ApplicationController

	def index #define a existência de uma view index
		@users = User.all #recupera todos os usuários cadastrados
	end

	def show
		@user = User.find(params[:id])
	end

end
