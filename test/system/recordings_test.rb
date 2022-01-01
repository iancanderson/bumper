require "application_system_test_case"

class RecordingsTest < ApplicationSystemTestCase
  test "shows the latest recordings first" do
    oldest = create(:recording)
    middle = create(:recording)
    newest = create(:recording)

    visit recordings_url

    assert_selector "tr:nth-child(1)", text: newest.song.title
    assert_selector "tr:nth-child(2)", text: middle.song.title
    assert_selector "tr:nth-child(3)", text: oldest.song.title
  end
end
