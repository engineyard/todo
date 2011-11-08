require 'test_helper'

class CleanupControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
    @task = tasks(:one)
  end

  test "get index works" do
    get :index
    assert_response :success
  end

  test "setting up" do
    get :setup
    assert_response :redirect
    get :index
    assert_response :success
  end

  test "running" do
    post :run
    assert_response :success
  end

end
