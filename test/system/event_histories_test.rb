require "application_system_test_case"

class EventHistoriesTest < ApplicationSystemTestCase
  setup do
    @event_history = event_histories(:one)
  end

  test "visiting the index" do
    visit event_histories_url
    assert_selector "h1", text: "Event Histories"
  end

  test "creating a Event history" do
    visit event_histories_url
    click_on "New Event History"

    fill_in "Subscription", with: @event_history.subscription_id
    fill_in "Type", with: @event_history.type
    click_on "Create Event history"

    assert_text "Event history was successfully created"
    click_on "Back"
  end

  test "updating a Event history" do
    visit event_histories_url
    click_on "Edit", match: :first

    fill_in "Subscription", with: @event_history.subscription_id
    fill_in "Type", with: @event_history.type
    click_on "Update Event history"

    assert_text "Event history was successfully updated"
    click_on "Back"
  end

  test "destroying a Event history" do
    visit event_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event history was successfully destroyed"
  end
end
