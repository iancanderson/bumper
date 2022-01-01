require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "about page" do
    visit about_url

    assert_selector "h1", text: "About"
  end
end
