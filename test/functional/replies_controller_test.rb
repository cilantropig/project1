require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @reply = replies(:one)
    @update ={
        title: 'Title_new',
        body: 'Body_new',
    }
    @user = users(:one)
    sign_in @user
  end

  def admin_sign_in
    @admin = users(:admin1)
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, reply: {title: 'Title_new',
        body: 'Body_new', post_id: '1'}
    end

    assert_redirected_to posts_path
  end

  test "should show reply" do
    get :show, id: @reply.to_param
    assert_response :success
  end

  test "user should not get edit" do
    get :edit, id: @reply.to_param
    assert_redirected_to root_path
  end

  test "admin should get edit" do
    admin_sign_in
    get :edit, id: @reply.to_param
    assert_response :success
  end

  test "user should not update reply" do
    put :update, id: @reply.to_param, reply: @update
    assert_redirected_to root_path
  end

  test "admin should update reply" do
    admin_sign_in
    put :update, id: @reply.to_param, reply: @update
    assert_redirected_to reply_path(assigns(:reply))
  end

  test "user should not destroy reply" do
    assert_no_difference('Reply.count') do
      delete :destroy, id: @reply.to_param
    end

    assert_redirected_to root_path
  end

  test "admin should destroy reply" do
    admin_sign_in

    assert_difference('Reply.count', -1) do
      delete :destroy, id: @reply.to_param
    end

    assert_redirected_to replies_path
  end
end
