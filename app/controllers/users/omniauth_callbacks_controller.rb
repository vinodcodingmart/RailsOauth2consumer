class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def codingmart
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication

    else
      session["devise.codingmart_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      
    end
  end

  def failure
    redirect_to root_path
  end
end