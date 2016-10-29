class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.update_with_password(update_params)
    redirect_to controller: 'messages',action: 'index'
  end

  private
  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
