class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_update_path_for(resource)
    current_user
  end

  # deviseで name,profile_image　の登録、編集に必要なコード
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile_image])
  end
end