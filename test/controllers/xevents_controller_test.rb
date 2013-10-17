require 'test_helper'

class XeventsControllerTest < ActionController::TestCase
  setup do
    @xevent = xevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xevent" do
    assert_difference('Xevent.count') do
      post :create, xevent: { content: @xevent.content, location: @xevent.location, summary: @xevent.summary, time: @xevent.time, title: @xevent.title }
    end

    assert_redirected_to xevent_path(assigns(:xevent))
  end

  test "should show xevent" do
    get :show, id: @xevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xevent
    assert_response :success
  end

  test "should update xevent" do
    patch :update, id: @xevent, xevent: { content: @xevent.content, location: @xevent.location, summary: @xevent.summary, time: @xevent.time, title: @xevent.title }
    assert_redirected_to xevent_path(assigns(:xevent))
  end

  test "should destroy xevent" do
    assert_difference('Xevent.count', -1) do
      delete :destroy, id: @xevent
    end

    assert_redirected_to xevents_path
  end
end
