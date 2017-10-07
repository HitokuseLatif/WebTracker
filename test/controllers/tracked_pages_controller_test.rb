require 'test_helper'

class TrackedPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracked_page = tracked_pages(:one)
  end

  test "should get index" do
    get tracked_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_tracked_page_url
    assert_response :success
  end

  test "should create tracked_page" do
    assert_difference('TrackedPage.count') do
      post tracked_pages_url, params: { tracked_page: { homepageURL: @tracked_page.homepageURL, pageURL: @tracked_page.pageURL, totalPV: @tracked_page.totalPV, urlPV: @tracked_page.urlPV } }
    end

    assert_redirected_to tracked_page_url(TrackedPage.last)
  end

  test "should show tracked_page" do
    get tracked_page_url(@tracked_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracked_page_url(@tracked_page)
    assert_response :success
  end

  test "should update tracked_page" do
    patch tracked_page_url(@tracked_page), params: { tracked_page: { homepageURL: @tracked_page.homepageURL, pageURL: @tracked_page.pageURL, totalPV: @tracked_page.totalPV, urlPV: @tracked_page.urlPV } }
    assert_redirected_to tracked_page_url(@tracked_page)
  end

  test "should destroy tracked_page" do
    assert_difference('TrackedPage.count', -1) do
      delete tracked_page_url(@tracked_page)
    end

    assert_redirected_to tracked_pages_url
  end
end
