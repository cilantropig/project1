ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'





class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def equalsFloat(float1, float2)
    return (float1 - float2).abs < 0.001
  end

  # Add more helper methods to be used by all tests here...
  require 'capybara/rails'

   class ActionDispatch::IntegrationTest
    include Capybara::DSL
    #helper for sign_in
     def user_sign_in_helper
    # this proves the user exists in the database ...
        User.create!(:id => 4, :first_name => "User4", :last_name => "Last4", :email => "user4@test.com", :password => "ruby4all")
        visit new_user_session_path
        fill_in "Email", :with => "user4@test.com"
        fill_in "Password", :with => "ruby4all"
        click_button "Sign in"
        assert page.has_content?('successfully')
    end
  end
end
