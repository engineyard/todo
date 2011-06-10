class TasksController < ApplicationController


  def index
    @todo = Task.where(:done => false)
    @task = Task.new
    @lists = List.all
    @list = List.new
    
    respond_to do |format|
      format.html
    end
  end


  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to(tasks_url(:list => @task.list.id), :notice => 'Task was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to( tasks_url(:list => @task.list.id), :notice => 'Task was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url(:list => @task.list_id)) }
    end
  end
  
 
end
