require 'test_helper'

class EventHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_history = event_histories(:one)
  end

  test "should get index" do
    get event_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_event_history_url
    assert_response :success
  end

  test "should create event_history" do
    assert_difference('EventHistory.count') do
      post event_histories_url, params: { event_history: { subscription_id: @event_history.subscription_id, type: @event_history.type } }
    end

    assert_redirected_to event_history_url(EventHistory.last)
  end

  test "should show event_history" do
    get event_history_url(@event_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_history_url(@event_history)
    assert_response :success
  end

  test "should update event_history" do
    patch event_history_url(@event_history), params: { event_history: { subscription_id: @event_history.subscription_id, type: @event_history.type } }
    assert_redirected_to event_history_url(@event_history)
  end

  test "should destroy event_history" do
    assert_difference('EventHistory.count', -1) do
      delete event_history_url(@event_history)
    end

    assert_redirected_to event_histories_url
  end
end
