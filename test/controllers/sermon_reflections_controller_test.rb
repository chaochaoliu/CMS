require 'test_helper'

class SermonReflectionsControllerTest < ActionController::TestCase
  setup do
    @sermon_reflection = sermon_reflections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sermon_reflections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sermon_reflection" do
    assert_difference('SermonReflection.count') do
      post :create, sermon_reflection: { content: @sermon_reflection.content }
    end

    assert_redirected_to sermon_reflection_path(assigns(:sermon_reflection))
  end

  test "should show sermon_reflection" do
    get :show, id: @sermon_reflection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sermon_reflection
    assert_response :success
  end

  test "should update sermon_reflection" do
    patch :update, id: @sermon_reflection, sermon_reflection: { content: @sermon_reflection.content }
    assert_redirected_to sermon_reflection_path(assigns(:sermon_reflection))
  end

  test "should destroy sermon_reflection" do
    assert_difference('SermonReflection.count', -1) do
      delete :destroy, id: @sermon_reflection
    end

    assert_redirected_to sermon_reflections_path
  end
end
