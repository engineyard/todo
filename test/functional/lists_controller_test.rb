require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, :list => @list.attributes
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, :id => @list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @list.to_param
    assert_response :success
  end

  test "should update list" do
    put :update, :id => @list.to_param, :list => @list.attributes
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, :id => @list.to_param
    end

    assert_redirected_to lists_path
  end
end
