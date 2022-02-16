class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
      if user
        flash[:notice] = "ログインに成功しました"
        top_hello
      else
        flash[:notice] = "ログインできませんでした"
        new_user_registration
      end
    end
end
