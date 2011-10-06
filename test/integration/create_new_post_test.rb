require 'test_helper'

class CreateNewPostTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "create new post" do
    # login user
    click_link "New Post"
    assert_contain("Create Post")
    fill_in "Title", :with => "New Test Post"
    fill_in "Body", :with => "Content of the new post"
    click_button "Create Post"
    assert_contain("New Post")
    assert_contain("Content of the new post")
    # check that the new post has been created in the database
  end

end
