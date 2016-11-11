class UsersController < ApplicationController
  def index
    @users = User.where('name LIKE ?',"%#{params[:name]}%")
    respond_to do |format|
      format.html {}
      format.json { render json: @users}
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    if user.update(update_params)
      flash[:edit] = "ユーザー情報を変更しました"
      redirect_to root_url
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
