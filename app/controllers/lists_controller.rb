class ListsController < ApplicationController

  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to(tasks_url(:list => @list.id), :notice => 'List was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
    end
  end
end
