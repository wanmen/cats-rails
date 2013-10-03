require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get helpme" do
    get :helpme
    assert_response :success
  end

  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get joinus" do
    get :joinus
    assert_response :success
  end

  test "should get markdowneditor" do
    get :markdowneditor
    assert_response :success
  end

end
