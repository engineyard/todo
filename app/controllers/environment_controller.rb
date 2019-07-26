class EnvironmentController < ApplicationController
  def index
    @volumes = `df -h`
  end
end
