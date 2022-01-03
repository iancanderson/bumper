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

  test "doesn't show songs that have been recorded" do
    recorded_song = create(:recording).song

    visit root_url

    assert_selector "h1", text: "Song Queue"

    refute_selector "tr:nth-child(1)", text: recorded_song.title
  end

  test "non-admin cannot add songs" do
    non_admin = create(:user)
    passwordless_sign_in(non_admin)

    visit root_url
    refute_selector "h1", text: "Add a Song"
  end

  test "admin can add a new song" do
    admin = create(:user, :admin)
    passwordless_sign_in(admin)

    existing_song = create(:song)

    visit root_url
    click_on "Add a Song"

    assert_selector "h1", text: "Add a Song"

    fill_in "Artist", with: "The Beatles"
    fill_in "Title", with: "Michelle"

    click_on "Create Song"

    assert_selector "h1", text: "Song Queue"
    assert_selector "tr:nth-child(1)", text: existing_song.title
    assert_selector "tr:nth-child(2)", text: "Michelle"
  end
end
