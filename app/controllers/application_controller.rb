class ApplicationController < ActionController::Base
  def logout
    sign_out current_user
  end
end
