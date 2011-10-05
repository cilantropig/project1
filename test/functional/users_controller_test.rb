require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:one)
    sign_in @user

    @update={
        :first_name=>'Test2',
        :last_name => 'Last2',
        :email => 'user1@test.com',
        :password => 'ruby4all'
    }
  end

  def admin_sign_in
    @admin = users(:admin1)
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {:first_name => 'A', :last_name=>'B', :email => 'test@test1.com', :password=>'ruby4all', :confirm_password=>'ruby4all'}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  #user update and deletion is handled by devise

  test "user should not get edit" do
    get :edit, id: @user.to_param
    assert_redirected_to root_path
  end

  test "user should not update user" do
      put :update, id: @user.to_param, user: @update
      assert_redirected_to root_path
  end

  test "admin should update user" do
    admin_sign_in
    put :update, id: @user.to_param, user: @update
    assert_redirected_to user_path(assigns(:user))
  end

  test "user should not destroy user" do
    assert_no_difference('User.count') do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to root_path
  end

  test "admin should destroy user" do
    admin_sign_in

    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to admin_manage_users_path
  end
end
