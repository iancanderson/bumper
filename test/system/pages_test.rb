require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "about page" do
    visit root_url
    click_on "About"

    assert_selector "h1", text: "About"
  end
end
