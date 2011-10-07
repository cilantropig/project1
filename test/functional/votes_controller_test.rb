require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @vote = votes(:one)
    @post = posts(:two)
    @user = users(:three)
    sign_in @user
  end

  def admin_sign_in
    @admin = users(:admin1)
    sign_in @admin
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post :create, vote: {}, post_id: @post.id
    end

    assert_redirected_to posts_path
  end


  test "user should not destroy vote" do

    assert_no_difference('Vote.count') do
      delete :destroy, id: @vote.to_param
    end

    assert_redirected_to root_path
  end

  test "admin should destroy vote" do
    admin_sign_in

    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote.to_param
    end

    assert_redirected_to posts_path
  end
end
