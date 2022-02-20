class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = User.find(params[:id])
  end

  def update
    session[:user_id] = @user.id
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :introduce, :image))
      flash[:notice] = "「#{@user.name}」の情報を更新しました"
      redirect_to :accounts
    else
      render "edit", status: :unprocessable_entity
    end
  end
end