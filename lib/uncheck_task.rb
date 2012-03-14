class UncheckTask < Struct.new(:task_id)
  def perform
    if task = Task.find_by_id(task_id)
      task.done = false
      task.save
    end
  end
  handle_asynchronously :perform
end