class TasksController < ApplicationController
  def index
    @todo   = Task.where(:done => false)
    @task   = Task.new
    @lists  = List.all
    @list   = List.new

    respond_to do |format|
      format.html
      format.json do
        render :json => {:tasks => Task.all.map(&:to_json) }
      end
    end
  end

  def create
    @list = List.find(params[:list_id])
    raw_params = params[:task].is_a?(String) ? JSON.parse(params[:task]) : params[:task]
    task_params = ActionController::Parameters.new(raw_params)
    @task = @list.tasks.new(task_params.permit(:name))
    if @task.save
      status = "success"
      flash[:notice] = "Your task was created."
    else
      status = "failure"
      flash[:alert] = "There was an error creating your task."
    end
    respond_to do |format|
      format.html do
        redirect_to(list_tasks_url(@list))
      end
      format.json do
        render :json => {:status => status, :task => @task.to_json}
      end
    end
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(task_attributes)
        format.html { redirect_to( list_tasks_url(@list), :notice => 'Task was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(list_tasks_url(@list)) }
    end
  end

  private

  def task_attributes
    params.require(:task).permit(:name, :done, :list_id)
  end
end
