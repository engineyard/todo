class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  # TODO use session
  def current_user
    User.last
  end
end
