require 'test_helper'

class ShipperControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = FactoryGirl.create(:admin)
    @carrier = FactoryGirl.create(:carrier)
    @shipper = FactoryGirl.create(:shipper)
    @driver = FactoryGirl.create(:driver)
    @other_shipper = FactoryGirl.create(:shipper)
  end

  # ========== INDEX ==========
  test "should get index when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get shippers_path
    assert_response :success
  end

  test "should not get index when not logged in" do
    get shippers_path
    assert_redirected_to new_admin_session_path
  end

  test "should not get index when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get shippers_path
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get index when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get shippers_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get index when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get shippers_path
    assert_redirected_to driver_path(@driver)
  end

  # ========== NEW ==========
  test "should get new when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get new_shipper_path
    assert_response :success
  end

  test "should not get new when not logged in" do
    get new_shipper_path
    assert_redirected_to new_admin_session_path
  end

  test "should not get new when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get new_shipper_path
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get new when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get new_shipper_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get new when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get new_shipper_path
    assert_redirected_to driver_path(@driver)
  end

  # ========== CREATE ==========

  # ========== SHOW ==========
  test "should show shipper when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get shipper_path(@shipper)
    assert_response :success
  end

  test "should show shipper when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get shipper_path(@shipper)
    assert_response :success
  end

  test "should not show shipper when logged in as other shipper" do
    login_as(@other_shipper, :scope => :shipper)
    get shipper_path(@shipper)
    assert_redirected_to shipper_path(@other_shipper)
  end

  test "should not show shipper when not logged in" do
    get shipper_path(@shipper)
    assert_redirected_to new_shipper_session_path
  end

  test "should not show shipper when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get shipper_path(@shipper)
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not show shipper when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get shipper_path(@shipper)
    assert_redirected_to driver_path(@driver)
  end

  # ========== EDIT ==========
  test "should get edit when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get edit_shipper_path(@shipper)
    assert_response :success
  end

  test "should get edit when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get edit_shipper_path(@shipper)
    assert_response :success
  end

  test "should not get edit when logged in as other shipper" do
    login_as(@other_shipper, :scope => :shipper)
    get edit_shipper_path(@shipper)
    assert_response :redirect
  end

  test "should not get edit when not logged in" do
    get edit_shipper_path(@shipper)
    assert_redirected_to new_shipper_session_path
  end

  test "should not get edit when logged in as shipper" do
    login_as(@carrier, :scope => :carrier)
    get edit_shipper_path(@shipper)
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get edit when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get edit_shipper_path(@shipper)
    assert_redirected_to driver_path(@driver)
  end

  # ========== UPDATE ==========
  # test "should update carrier" do
  #   patch carrier_path(@carrier), params: { carrier: { CIN: @carrier.CIN, PAN: @carrier.PAN, PoC: @carrier.PoC, ST_num: @carrier.ST_num, address: @carrier.address, email: @carrier.email, incorporation_date: @carrier.incorporation_date, name: @carrier.name, org_type: @carrier.org_type, owner_name: @carrier.owner_name, phone: @carrier.phone, reg_date: @carrier.reg_date } }
  #   assert_redirected_to carrier_path(@carrier)
  # end

  # ========== DESTROY ==========
  test "should destroy shipper when logged in as admin" do
    login_as(@admin, :scope => :admin)
    assert_difference('Shipper.count', -1) do
      delete shipper_path(@shipper)
    end

    assert_redirected_to shippers_path
  end

  test "should not destroy shipper when not logged in" do
    assert_no_difference 'Shipper.count' do
      delete shipper_path(@shipper)
    end

    assert_redirected_to new_admin_session_path
  end

  test "should not destroy shipper when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    assert_no_difference 'Shipper.count' do
      delete shipper_path(@shipper)
    end

    assert_redirected_to shipper_path(@shipper)
  end

  test "should not destroy shipper when logged in as other shipper" do
    login_as(@other_shipper, :scope => :shipper)
    assert_no_difference 'Shipper.count' do
      delete shipper_path(@shipper)
    end

    assert_redirected_to shipper_path(@other_shipper)
  end

  test "should not destroy shipper when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    assert_no_difference 'Shipper.count' do
      delete shipper_path(@shipper)
    end

    assert_redirected_to carrier_path(@carrier)
  end

  test "should not destroy shipper when logged in as driver" do
    login_as(@driver, :scope => :driver)
    assert_no_difference 'Shipper.count' do
      delete shipper_path(@shipper)
    end

    assert_redirected_to driver_path(@driver)
  end
  # ====== DASHBOARD =======
end
