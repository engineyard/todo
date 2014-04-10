class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_cache_control_headers

  def set_cache_control_headers(max_age = 1.seconds.to_s)
    if request.method == "GET"
      request.session_options[:skip] = true  # removes session data
      response.headers['Cache-Control'] = 'public, no-cache'
      # response.headers['Surrogate-Key'] = "blah"
      response.headers['Surrogate-Control'] = "max-age: #{max_age}"
    end
  end

end
