require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  fixtures :all

    def test_user_sign_in
  # this proves the user exists in the database ...
      User.create!(:id => 2, :first_name => "User2", :last_name => "Last2", :email => "user7@test.com", :password => "ruby4all")
      visit new_user_session_path
      fill_in "Email", :with => "user7@test.com"
      fill_in "Password", :with => "ruby4all"
      click_button "Sign in"
       assert page.has_content?('successfully')
  end

end
