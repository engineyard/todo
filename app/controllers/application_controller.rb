class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cache_or_purge

  def cache_or_purge(max_age = 1.second.to_s)
    if request.method == "GET"
      request.session_options[:skip] = true  # removes session data
      response.headers['Cache-Control'] = 'public, no-cache'
      response.headers['Surrogate-Key'] = "blah"
      response.headers['Surrogate-Control'] = "max-age=#{max_age}"
    # else
    #   api_key = EY::Config.get(:fastly, "FASTLY_API_KEY")
    #   service_id = EY::Config.get(:fastly, "FASTLY_SERVICE_ID")
    #   Excon.new('https://api.fastly.com').post(
    #     :headers => {'Fastly-Key' => api_key},
    #     :path => "/service/#{service_id}/purge/blah")
    end
  end

end
