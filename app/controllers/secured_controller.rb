class SecuredController < ApplicationController

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash.now[:error] = exception.message
      redirect_to root_url
    else
      redirect_to new_user_session_url
    end
  end

end