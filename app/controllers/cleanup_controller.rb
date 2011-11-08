class CleanupController < ApplicationController

  def index
    @setup = (cron_client.list_jobs.size > 0)
  end

  def setup
    cron_client.create_job(run_cleanup_url, "* */1 * * *") #callback every hour
    redirect_to cleanup_url
  end

  def run
    #Doesn't actually do anything :-P
    render :text => "ok"
  end

private

  def cron_client
    @client ||= Chronatog::Client.setup!(EY::Config.get(:chronatog, 'service_url'), 
                                         EY::Config.get(:chronatog, 'auth_username'), 
                                         EY::Config.get(:chronatog, 'auth_password'))
  end

end
