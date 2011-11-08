require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, :list => {:name => "NewList"}
    end

    assert_redirected_to list_tasks_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, :id => @list.to_param
    end

    assert_redirected_to root_path
  end
end
