require 'test_helper'

class AddNewReplyTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "add new reply" do

    # login user
    user_sign_in_helper

    visit posts_path
    # locate a post
    click_link "Reply"
    assert page.has_content?("Create Reply")
    fill_in "Title", :with => "New Test Reply"
    fill_in "Body", :with => "Content of the new reply"
    click_button "Create Reply"
    assert page.has_content?("New Test Reply")
    assert page.has_content?("Content of the new reply")
    # check that the new reply has been created in the database for the correct post
  end
end
