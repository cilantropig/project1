require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  fixtures :all

    def test_user_sign_in
       visit root_path
       click_link "Sign in"
       fill_in "Email", :with => "che@ncus.edu"
       fill_in "Password", :with =>"ruby4all"
       click_button "Sign in"
       assert_contain "Signed in successfully."
  end

end
