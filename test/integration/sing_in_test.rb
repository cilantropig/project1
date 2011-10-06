require 'test_helper'

class SingInTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "user sign in" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", :with => "admin@glq.com"
    fill_in "Password", :with =>"ruby4all"
    click_button "Sign in"
    assert_contain('Manage users')
  end

  test "admin sign in" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", :with => "che@ncsu.edu"
    fill_in "Password", :with =>"ruby4all"
    click_button "Sign in"
    assert_contain('posts')
  end

end
