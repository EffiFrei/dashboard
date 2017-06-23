require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = FactoryGirl.create(:request)
    @admin   = FactoryGirl.create(:admin)
    @shipper = FactoryGirl.create(:shipper)
    @carrier = FactoryGirl.create(:carrier)
    @driver  = FactoryGirl.create(:driver)
  end

  # ======== INDEX =========
  test "should get index when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get requests_path
    assert_response :success
  end

  test "should get index when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get requests_path
    assert_response :success
  end

  test "should get index when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get requests_path
    assert_response :success
  end

  test "should get index when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get requests_path
    assert_response :success
  end

  test "should not get index when not logged in" do
    get requests_path
    assert_response :redirect
    assert_redirected_to new_shipper_session_path
  end

  # ======== CREATE =========

  # ======== NEW =========
  test "should get new when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get new_request_path
    assert_response :success
  end

  test "should get new when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get new_request_path
    assert_response :success
  end

  test "should not get new when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get new_request_path
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get new when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get new_request_path
    assert_redirected_to driver_path(@driver)
  end

  test "should not get new when not logged in" do
    get new_request_path
    assert_redirected_to new_shipper_session_path
  end
 
  # ======== EDIT =========
  test "should get edit when logged in as admin" do
    login_as(@admin, :scope => :admin)
    # get :edit, id: @request
    get edit_request_path(@request)
    assert_response :success
  end

  test "should get edit when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get edit_request_path(@request)
    assert_response :success
  end

  test "should not get edit when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get edit_request_path(@request)
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get edit when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get edit_request_path(@request)
    assert_redirected_to driver_path(@driver)
  end

  test "should not get edit when not logged in" do
    get edit_request_path(@request)
    assert_redirected_to new_shipper_session_path
  end
 
  # ======== SHOW =========
  test "should get show when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get request_path(@request)
    assert_response :success
  end

  test "should get show when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get request_path(@request)
    assert_response :success
  end

  test "should get show when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get request_path(@request)
    assert_response :success
  end

  test "should get show when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get request_path(@request)
    assert_response :success
  end

  test "should get show when not logged in" do
    get request_path(@request)
    assert_redirected_to new_shipper_session_path
  end
 
  # ======== UPDATE =========

  # ======== DESTROY =========
  test "should get destroy when logged in as admin" do
    login_as(@admin, :scope => :admin)
    assert_difference('Request.count', -1) do
      delete request_path(@request)
    end
    assert_redirected_to requests_path
  end

  test "should not get destroy when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    assert_no_difference 'Request.count' do
      delete request_path(@request)
    end
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get destroy when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    assert_no_difference 'Request.count' do
      delete request_path(@request)
    end
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get destroy when logged in as driver" do
    login_as(@driver, :scope => :driver)
    assert_no_difference 'Request.count' do
      delete request_path(@request)
    end
    assert_redirected_to driver_path(@driver)
  end

  test "should not get destroy when not logged in" do
    assert_no_difference 'Request.count' do
      delete request_path(@request)
    end
    assert_redirected_to new_admin_session_path
  end

end
