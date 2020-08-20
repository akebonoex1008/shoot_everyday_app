class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 簡単ログイン用定数
  GUEST_USER = 'guest-1@example.com'
  TEST_USER  = 'tester-1@example.com'

  def after_sign_in_path_for(_resource)
    current_user
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    current_user
  end

  def after_inactive_sign_up_path_for(_resource)
    current_user
  end

  def current_user?(user)
    user == current_user
  end
end
