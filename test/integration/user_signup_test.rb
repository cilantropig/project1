require 'test_helper'

class UserSignupTest < ActionController::IntegrationTest
 # include Devise::TestHelpers

 # setup do
 #   if(user_signed_in?)
 #        sign_out current_user
 #   end
 # end

  def test_new_user_sign_up
       visit new_user_registration_path
       click_link "Sign up"
       fill_in "First name", :with => "Peter"
       fill_in "Last name", :with => "Pan"
       fill_in "Email", :with => "peter@test.com"
       fill_in "Password", :with =>"ruby4all"
       fill_in "Password confirmation", :with => "ruby4all"
       click_button "Sign up"
       assert page.has_content?("Welcome! You have signed up successfully.")
  end

end