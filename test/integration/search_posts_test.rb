require 'test_helper'

class SearchPostsTest < ActionDispatch::IntegrationTest
  fixtures :all

  def test_new_user_sign_up
       visit root_path
       fill_in "search", :with => "Ruby"
       click_button "Search"
       # verify that the results table contains 2 rows
  end
end
