require 'test_helper'

class XclubsControllerTest < ActionController::TestCase
  setup do
    @xclub = xclubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xclubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xclub" do
    assert_difference('Xclub.count') do
      post :create, xclub: { name: @xclub.name, started: @xclub.started, summary: @xclub.summary, thumbnail: @xclub.thumbnail }
    end

    assert_redirected_to xclub_path(assigns(:xclub))
  end

  test "should show xclub" do
    get :show, id: @xclub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xclub
    assert_response :success
  end

  test "should update xclub" do
    patch :update, id: @xclub, xclub: { name: @xclub.name, started: @xclub.started, summary: @xclub.summary, thumbnail: @xclub.thumbnail }
    assert_redirected_to xclub_path(assigns(:xclub))
  end

  test "should destroy xclub" do
    assert_difference('Xclub.count', -1) do
      delete :destroy, id: @xclub
    end

    assert_redirected_to xclubs_path
  end
end
