require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get manage_users" do
    get :manage_users
    assert_response :success
  end

  test "should get manage_posts" do
    get :manage_posts
    assert_response :success
  end

  test "should get view_reports" do
    get :view_reports
    assert_response :success
  end

end
