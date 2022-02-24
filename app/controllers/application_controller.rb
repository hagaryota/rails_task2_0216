class ApplicationController < ActionController::Base
  before_action :search
  
  def search
    @results = @q.result
  end

  def set_q
    @q = User.ransack(params[:q])
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
