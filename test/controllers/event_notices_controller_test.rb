require 'test_helper'

class EventNoticesControllerTest < ActionController::TestCase
  setup do
    @event_notice = event_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_notice" do
    assert_difference('EventNotice.count') do
      post :create, event_notice: { content: @event_notice.content, publisher: @event_notice.publisher, title: @event_notice.title }
    end

    assert_redirected_to event_notice_path(assigns(:event_notice))
  end

  test "should show event_notice" do
    get :show, id: @event_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_notice
    assert_response :success
  end

  test "should update event_notice" do
    patch :update, id: @event_notice, event_notice: { content: @event_notice.content, publisher: @event_notice.publisher, title: @event_notice.title }
    assert_redirected_to event_notice_path(assigns(:event_notice))
  end

  test "should destroy event_notice" do
    assert_difference('EventNotice.count', -1) do
      delete :destroy, id: @event_notice
    end

    assert_redirected_to event_notices_path
  end
end
