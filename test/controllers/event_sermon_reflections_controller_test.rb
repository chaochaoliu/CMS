require 'test_helper'

class EventSermonReflectionsControllerTest < ActionController::TestCase
  setup do
    @event_sermon_reflection = event_sermon_reflections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_sermon_reflections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_sermon_reflection" do
    assert_difference('EventSermonReflection.count') do
      post :create, event_sermon_reflection: { content: @event_sermon_reflection.content, event_sermon_id: @event_sermon_reflection.event_sermon_id, name: @event_sermon_reflection.name }
    end

    assert_redirected_to event_sermon_reflection_path(assigns(:event_sermon_reflection))
  end

  test "should show event_sermon_reflection" do
    get :show, id: @event_sermon_reflection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_sermon_reflection
    assert_response :success
  end

  test "should update event_sermon_reflection" do
    patch :update, id: @event_sermon_reflection, event_sermon_reflection: { content: @event_sermon_reflection.content, event_sermon_id: @event_sermon_reflection.event_sermon_id, name: @event_sermon_reflection.name }
    assert_redirected_to event_sermon_reflection_path(assigns(:event_sermon_reflection))
  end

  test "should destroy event_sermon_reflection" do
    assert_difference('EventSermonReflection.count', -1) do
      delete :destroy, id: @event_sermon_reflection
    end

    assert_redirected_to event_sermon_reflections_path
  end
end
