require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, :task => @task.attributes, :list_id => @list.id
    end

    assert_redirected_to list_tasks_path(@list)
  end

  test "should update task" do
    put :update, :id => @task.to_param, :task => @task.attributes, :list_id => @list.id
    assert_redirected_to list_tasks_path(@list)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, :id => @task.to_param, :list_id => @list.id
    end

    assert_redirected_to list_tasks_path(@list)
  end
end
