require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "can log in with an emailed link" do
    user = create(:user, email: "foo@example.com")
    visit root_url
    click_on "Sign In"

    fill_in "Email address", with: user.email
    click_on "Send magic link"

    mail = ActionMailer::Base.deliveries.last
    refute_nil mail

    # TODO: actually visit the link in the email
  end
end
