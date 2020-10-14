class SecuredController < ApplicationController

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url, :flash => {:error => exception.message}
    else
      redirect_to new_user_session_url
    end
  end

end