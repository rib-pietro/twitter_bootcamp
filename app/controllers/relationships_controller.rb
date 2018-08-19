class RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:id])
		# unless current_user.following? @user
		current_user.follow!(@user)
		redirect_to user_path(@user), notice: "Usuário seguido com sucesso"
		# else
		#	reditect_to user_path(@user), notice: "Você já segue esse usuário"
		# end
	end

	def destroy
		@user = User.find(params[:id])
		current_user.unfollow!(@user)
		redirect_to user_path(@user), notice: "Você não segue mais este usuário"
	end

end
