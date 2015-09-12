require 'test_helper'

class JobListingsControllerTest < ActionController::TestCase
  setup do
    @job_listing = job_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_listing" do
    assert_difference('JobListing.count') do
      post :create, job_listing: { company_id: @job_listing.company_id, contact: @job_listing.contact, date_posted: @job_listing.date_posted, description: @job_listing.description, location: @job_listing.location, title: @job_listing.title, url: @job_listing.url }
    end

    assert_redirected_to job_listing_path(assigns(:job_listing))
  end

  test "should show job_listing" do
    get :show, id: @job_listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_listing
    assert_response :success
  end

  test "should update job_listing" do
    patch :update, id: @job_listing, job_listing: { company_id: @job_listing.company_id, contact: @job_listing.contact, date_posted: @job_listing.date_posted, description: @job_listing.description, location: @job_listing.location, title: @job_listing.title, url: @job_listing.url }
    assert_redirected_to job_listing_path(assigns(:job_listing))
  end

  test "should destroy job_listing" do
    assert_difference('JobListing.count', -1) do
      delete :destroy, id: @job_listing
    end

    assert_redirected_to job_listings_path
  end
end
