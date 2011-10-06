require 'test_helper'

class ManageUsersTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "promote user to admin" do
    # login admin
    click_link "Manage users"
    assert_contain("Actions")
    click_link "Make admin"
    # verify in the database that the user now is an admin
  end

  test "delete user" do
    # login admin
    click_link "Manage users"
    assert_contain("Actions")
    click_link "Delete user"
    # verify in the database that the user and related posts, replies and votes have been deleted
  end


end
