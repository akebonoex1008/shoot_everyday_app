# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # deviseで name　の登録、編集に必要なコード
  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end
end
