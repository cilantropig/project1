require 'test_helper'

class AddNewReplyTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "add new reply" do
    # login user
    # locate a post
    click_link "Reply"
    assert_contain("Create Reply")
    fill_in "Title", :with => "New Test Reply"
    fill_in "Body", :with => "Content of the new reply"
    click_button "Create Reply"
    assert_contain("New Test Reply")
    assert_contain("Content of the new reply")
    # check that the new reply has been created in the database for the correct post
  end
end
