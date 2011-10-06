require 'test_helper'

class ReplyVotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @reply_vote = reply_votes(:one)
    @user = users(:one)
    @reply = replies(:two)
    sign_in @user
  end

  def admin_sign_in
    @admin = users(:admin1)
    sign_in @admin
  end

  test "should create reply_vote" do
    assert_difference('ReplyVote.count') do
      post :create, reply_vote: {
          reply_id: @reply.id
      }
    end

    assert_redirected_to posts_path
  end


  test "user should not destroy reply_vote" do
    assert_no_difference('ReplyVote.count') do
      delete :destroy, id: @reply_vote.to_param
    end

    assert_redirected_to root_path
  end

  test "admin should destroy reply_vote" do
    admin_sign_in
    assert_difference('ReplyVote.count', -1) do
      delete :destroy, id: @reply_vote.to_param
    end

    assert_redirected_to posts_path
  end
end
