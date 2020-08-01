# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # 簡単ログイン用
  def guest_login
    user = User.easy_login(GUEST_USER)
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def tester_login
    user = User.easy_login(TEST_USER)
    sign_in user
    redirect_to root_path, notice: 'テストユーザーとしてログインしました。'
  end
  
  def new
    session.delete('devise.omniauth_data')
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
