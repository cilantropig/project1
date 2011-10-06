require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  include Devise::TestHelpers

 setup do
    @admin = users(:admin1)
    sign_in @admin
  end

  def non_admin
    @user = users(:one)
    sign_in @user
  end
  test "admin should get manage_users" do
    get :manage_users
    assert_response :success
  end

  test "user should not get manage_users" do
    non_admin
    get :manage_users
    assert_redirected_to root_path
  end

  test "admin should get view_reports" do
    get :view_reports
    assert_response :success
  end

  test "user should not get view_reports" do
    non_admin
    get :view_reports
    assert_redirected_to root_path
  end
end
