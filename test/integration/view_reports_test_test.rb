require 'test_helper'

class ViewReportsTestTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "view reports" do
    # login admin
    click_link "View reports"
    assert_contain("Users report")
    click_link "Users report"
    assert_contain("Total Votes on Own")
  end
end
