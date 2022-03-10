class ApplicationController < ActionController::Base  
  before_action :search

  def autheniticate_user
    if @current_user==nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end

  def search
    @q = Room.ransack(params[:q])
    @search = @q.result
   end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      root_path
    else
      flash[:notice] = "ログインできませんでした"
      new_user_registration
    end
  end
end
