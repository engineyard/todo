class TaskCounter
  @queue = :default
  def self.perform
    size = Task.count
    Resque.logger.info "From resque: Total tasks on DB: #{size}"
  end
end
