require "application_system_test_case"

class SongsTest < ApplicationSystemTestCase
  test "shows the songs in order of position, ascending" do
    bottom = create(:song, queue_position: 3)
    top = create(:song, queue_position: 1)
    middle = create(:song, queue_position: 2)

    visit root_url

    assert_selector "h1", text: "Song Queue"

    assert_selector "tr:nth-child(1)", text: top.title
    assert_selector "tr:nth-child(2)", text: middle.title
    assert_selector "tr:nth-child(3)", text: bottom.title
  end
end
