require 'test_helper'

class EventSermonsControllerTest < ActionController::TestCase
  setup do
    @event_sermon = event_sermons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_sermons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_sermon" do
    assert_difference('EventSermon.count') do
      post :create, event_sermon: { content: @event_sermon.content, preacher: @event_sermon.preacher, sermon_audio: @event_sermon.sermon_audio, sermon_date: @event_sermon.sermon_date, sermon_video: @event_sermon.sermon_video, titil: @event_sermon.titil }
    end

    assert_redirected_to event_sermon_path(assigns(:event_sermon))
  end

  test "should show event_sermon" do
    get :show, id: @event_sermon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_sermon
    assert_response :success
  end

  test "should update event_sermon" do
    patch :update, id: @event_sermon, event_sermon: { content: @event_sermon.content, preacher: @event_sermon.preacher, sermon_audio: @event_sermon.sermon_audio, sermon_date: @event_sermon.sermon_date, sermon_video: @event_sermon.sermon_video, titil: @event_sermon.titil }
    assert_redirected_to event_sermon_path(assigns(:event_sermon))
  end

  test "should destroy event_sermon" do
    assert_difference('EventSermon.count', -1) do
      delete :destroy, id: @event_sermon
    end

    assert_redirected_to event_sermons_path
  end
end
