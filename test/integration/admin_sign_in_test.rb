require 'test_helper'

class SingInTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "admin user sign in" do
    User.create!(:id => 5, :first_name => "User5", :last_name => "Last5", :email => "uadmin5@test.com", :password => "ruby4all", :admin=> true)
    visit new_user_session_path
    click_link "Sign in"
    fill_in "Email", :with => "admin@glq.com"
    fill_in "Password", :with =>"ruby4all"
    click_button "Sign in"
    assert page.has_content?('Manage users')
  end
end
