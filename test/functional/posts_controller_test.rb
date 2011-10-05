require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @post = posts(:one)
    @update ={
        title: 'Title_new',
        body: 'Body_new'
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
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {:title => 'test post', :body => 'this is a test'}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post.to_param
    assert_response :success
  end

  test "user should not get edit" do
    get :edit, id: @post.to_param
    assert_redirected_to root_path
  end

  test "admin should get edit" do
    admin_sign_in
    get :edit, id: @post.to_param
    assert_response :success
  end

  test "user should not update post" do
    put :update, id: @post.to_param, post: @update
    assert_redirected_to root_path
  end

  test "admin should update post" do
    admin_sign_in
    put :update, id: @post.to_param, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "user should not destroy post" do

    assert_no_difference('Post.count') do
      delete :destroy, id: @post.to_param
    end

    assert_redirected_to root_path
  end

  test "admin should destroy post" do
    admin_sign_in

    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.to_param
    end

    assert_redirected_to posts_path
  end
end
