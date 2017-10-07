require 'test_helper'

class TrackedDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracked_datum = tracked_data(:one)
  end

  test "should get index" do
    get tracked_data_url
    assert_response :success
  end

  test "should get new" do
    get new_tracked_datum_url
    assert_response :success
  end

  test "should create tracked_datum" do
    assert_difference('TrackedDatum.count') do
      post tracked_data_url, params: { tracked_datum: { pageTitle: @tracked_datum.pageTitle, pageURL: @tracked_datum.pageURL, pageViews: @tracked_datum.pageViews, totalClicks: @tracked_datum.totalClicks } }
    end

    assert_redirected_to tracked_datum_url(TrackedDatum.last)
  end

  test "should show tracked_datum" do
    get tracked_datum_url(@tracked_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracked_datum_url(@tracked_datum)
    assert_response :success
  end

  test "should update tracked_datum" do
    patch tracked_datum_url(@tracked_datum), params: { tracked_datum: { pageTitle: @tracked_datum.pageTitle, pageURL: @tracked_datum.pageURL, pageViews: @tracked_datum.pageViews, totalClicks: @tracked_datum.totalClicks } }
    assert_redirected_to tracked_datum_url(@tracked_datum)
  end

  test "should destroy tracked_datum" do
    assert_difference('TrackedDatum.count', -1) do
      delete tracked_datum_url(@tracked_datum)
    end

    assert_redirected_to tracked_data_url
  end
end
