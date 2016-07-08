require 'test_helper'

class SermonSignInsControllerTest < ActionController::TestCase
  setup do
    @sermon_sign_in = sermon_sign_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sermon_sign_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sermon_sign_in" do
    assert_difference('SermonSignIn.count') do
      post :create, sermon_sign_in: {  }
    end

    assert_redirected_to sermon_sign_in_path(assigns(:sermon_sign_in))
  end

  test "should show sermon_sign_in" do
    get :show, id: @sermon_sign_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sermon_sign_in
    assert_response :success
  end

  test "should update sermon_sign_in" do
    patch :update, id: @sermon_sign_in, sermon_sign_in: {  }
    assert_redirected_to sermon_sign_in_path(assigns(:sermon_sign_in))
  end

  test "should destroy sermon_sign_in" do
    assert_difference('SermonSignIn.count', -1) do
      delete :destroy, id: @sermon_sign_in
    end

    assert_redirected_to sermon_sign_ins_path
  end
end
