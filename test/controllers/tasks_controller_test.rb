require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @notes = notes(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index, params: { notes_id: @notes }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { notes_id: @notes }
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, params: { notes_id: @notes, task: @task.attributes }
    end

    assert_redirected_to notes_task_path(@notes, Task.last)
  end

  test "should show task" do
    get :show, params: { notes_id: @notes, id: @task }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { notes_id: @notes, id: @task }
    assert_response :success
  end

  test "should update task" do
    put :update, params: { notes_id: @notes, id: @task, task: @task.attributes }
    assert_redirected_to notes_task_path(@notes, Task.last)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, params: { notes_id: @notes, id: @task }
    end

    assert_redirected_to notes_tasks_path(@notes)
  end
end
