class ListsController < ApplicationController

  def create
    @list = List.new(params[:list])
    @list.user = current_user
    if @list.save
        flash[:notice] = "Your list was created"
    else
        flash[:alert] = "There was an error creating your list."
    end
    redirect_to(list_tasks_url(@list))
  end

  def destroy
    @list = List.for_user(current_user).find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
    end
  end
end
