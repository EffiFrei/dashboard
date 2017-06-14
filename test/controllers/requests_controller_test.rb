require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
    @admin   = FactoryGirl.create(:admin)
    @shipper = FactoryGirl.create(:shipper)
    @carrier = FactoryGirl.create(:carrier)
    @driver  = FactoryGirl.create(:driver)
  end

  test "admin should get new" do
    login_as(@admin, :scope => :admin)
    get new_request_url
    assert_response :success
  end

  test "shipper should get new" do
    login_as(@shipper, :scope => :shipper)
    get new_request_url
    assert_response :success
  end

  test "admin should get index" do
    login_as(@admin, :scope => :admin)
    get requests_url
    assert_response :success
  end

  test "shipper should get index" do
    login_as(@shipper, :scope => :shipper)
    get requests_url
    assert_response :success
  end

  test "admin should get show" do
    login_as(@admin, :scope => :admin)
    get request_url(@request)
    assert_response :success
  end

  test "shipper should get show" do
    login_as(@shipper, :scope => :shipper)
    get request_url(@request)
    assert_response :success
  end

  test "carrier should get show" do
    login_as(@carrier, :scope => :carrier)
    get request_url(@request)
    assert_response :success
  end

  test "driver should get show" do
    login_as(@driver, :scope => :driver)
    get request_url(@request)
    assert_response :success
  end

  test "only logged in user should get show" do
    get request_url(@request)
    assert_response :redirect
  end

  test "admin should get edit" do
    login_as(@admin, :scope => :admin)
    get edit_request_url(@request)
    assert_response :success
  end

  test "shipper should get edit" do
    login_as(@shipper, :scope => :shipper)
    get edit_request_url(@request)
    assert_response :success
  end

  test "admin should get destroy" do
    login_as(@admin, :scope => :admin)
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end
    assert_redirected_to requests_url
  end

  test "shipper should get destroy" do
    login_as(@shipper, :scope => :shipper)
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end
    assert_redirected_to requests_url
  end

end
