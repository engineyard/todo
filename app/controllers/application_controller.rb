class ApplicationController < ActionController::Base
  protect_from_forgery

  def delayed_job_admin_authentication
    true
  end
end
