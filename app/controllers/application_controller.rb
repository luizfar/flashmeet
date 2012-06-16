class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_logged_in

  def ensure_logged_in
    if !@user
      redirect_to "/auth/twitter"
    end
  end

end
