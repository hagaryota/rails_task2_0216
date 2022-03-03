class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(current_user.id) 
  end

  def edit
    @user = User.find(current_user.id)
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