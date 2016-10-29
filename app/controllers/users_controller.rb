class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    if user.update(update_params)
      flash[:edit] = "ユーザー情報を変更しました"
      redirect_to controller: 'messages',action: 'index'
    else
      redirect_to action: 'edit'
      user.errors.full_messages.each do |message|
        flash[:error] = message
     end
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end
