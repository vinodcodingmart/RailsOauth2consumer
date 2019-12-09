class ApplicationController < ActionController::Base
  def logout
    sign_out current_user
    redirect_to :user_session
  end
end
