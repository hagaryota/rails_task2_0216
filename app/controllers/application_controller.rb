class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?  
  before_action :authenticate_user!

    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました"
        home_index
      else
        flash[:notice] = "ログインできませんでした"
        new_user_registration
      end
    end
end
