require 'test_helper'

class ViewReportsTestTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "view reports" do
    # login admin
    click_link "View reports"
    assert page.has_content?("Users report")
    click_link "Users report"
    assert page.has_content?("Total Votes on Own")
  end
end
