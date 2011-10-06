require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "vote a post" do
    # login user
    # locate a post
    click_link "Votes"
    # check that the new vote for the post has been created in the database
  end

  test "vote a reply" do
    # login user
    # locate a reply
    click_link "Votes"
    # check that the new vote for the reply has been created in the database
  end
end
