require 'test_helper'

class TaskSeekersControllerTest < ActionController::TestCase
  setup do
    @task_seeker = task_seekers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_seekers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_seeker" do
    assert_difference('TaskSeeker.count') do
      post :create, task_seeker: {  }
    end

    assert_redirected_to task_seeker_path(assigns(:task_seeker))
  end

  test "should show task_seeker" do
    get :show, id: @task_seeker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_seeker
    assert_response :success
  end

  test "should update task_seeker" do
    patch :update, id: @task_seeker, task_seeker: {  }
    assert_redirected_to task_seeker_path(assigns(:task_seeker))
  end

  test "should destroy task_seeker" do
    assert_difference('TaskSeeker.count', -1) do
      delete :destroy, id: @task_seeker
    end

    assert_redirected_to task_seekers_path
  end
end
