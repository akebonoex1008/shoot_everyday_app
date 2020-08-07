class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :check_guest, only: %i[update destroy]

  # 簡単ログインのユーザーは削除不可
  def check_guest
    if resource.email == GUEST_USER
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除できません。'
    end
  end

  def after_update_path_for(resource)
    current_user
  end

  # deviseで name,profile_image　の登録、編集に必要なコード
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile_image])
  end
end