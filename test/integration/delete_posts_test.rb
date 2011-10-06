require 'test_helper'

class DeletePostsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "delete a post" do
    # login admin
    # locate a post
    click_link "Delete"
    # verify in the database that the post has been deleted
    # verify in the database that the all the replies related to the post have been deleted
    # verify in the database that the all the votes related to the post have been deleted
    # verify in the database that the all the votes related to the replies related to the post have been deleted
  end
end
