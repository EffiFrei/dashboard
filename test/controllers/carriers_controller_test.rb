require 'test_helper'

class CarriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = FactoryGirl.create(:admin)
    @carrier = FactoryGirl.create(:carrier)
    @shipper = FactoryGirl.create(:shipper)
    @driver = FactoryGirl.create(:driver)
    @other_carrier = FactoryGirl.create(:carrier)
  end

  # ========== INDEX ==========
  test "should get index when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get carriers_path
    assert_response :success
  end

  test "should not get index when not logged in" do
    get carriers_path
    assert_redirected_to new_admin_session_path
  end

  test "should not get index when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get carriers_path
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get index when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get carriers_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get index when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get carriers_path
    assert_redirected_to driver_path(@driver)
  end

  # ========== NEW ==========
  test "should get new when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get new_carrier_path
    assert_response :success
  end

  test "should not get new when not logged in" do
    get new_carrier_path
    assert_redirected_to new_admin_session_path
  end

  test "should not get new when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get new_carrier_path
    assert_redirected_to carrier_path(@carrier)
  end

  test "should not get new when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get new_carrier_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get new when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get new_carrier_path
    assert_redirected_to driver_path(@driver)
  end

  # ========== CREATE ==========
  # test "should create carrier" do
  #   assert_difference('Carrier.count') do
  #     post carriers_path, params: { carrier: { CIN: @carrier.CIN, PAN: @carrier.PAN, PoC: @carrier.PoC, ST_num: @carrier.ST_num, address: @carrier.address, email: @carrier.email, incorporation_date: @carrier.incorporation_date, name: @carrier.name, org_type: @carrier.org_type, owner_name: @carrier.owner_name, phone: @carrier.phone, reg_date: @carrier.reg_date } }
  #   end

  #   assert_redirected_to carrier_path(Carrier.last)
  # end

  # ========== SHOW ==========
  test "should show carrier when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get carrier_path(@carrier)
    assert_response :success
  end

  test "should show carrier when logged in as carreer" do
    login_as(@carrier, :scope => :carrier)
    get carrier_path(@carrier)
    assert_response :success
  end

  test "should not show carrier when logged in as other carreer" do
    login_as(@other_carrier, :scope => :carrier)
    get carrier_path(@carrier)
    assert_redirected_to carrier_path(@other_carrier)
  end

  test "should not show carrier when not logged in" do
    get carrier_path(@carrier)
    assert_redirected_to new_carrier_session_path
  end

  test "should not show carrier when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get carrier_path(@carrier)
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not show carrier when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get carrier_path(@carrier)
    assert_redirected_to driver_path(@driver)
  end

  # ========== EDIT ==========
  test "should get edit when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get edit_carrier_path(@carrier)
    assert_response :success
  end

  test "should get edit when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get edit_carrier_path(@carrier)
    assert_response :success
  end

  test "should not get edit when logged in as other carrier" do
    login_as(@other_carrier, :scope => :carrier)
    get edit_carrier_path(@carrier)
    assert_response :redirect
  end

  test "should not get edit when not logged in" do
    get edit_carrier_path(@carrier)
    assert_redirected_to new_carrier_session_path
  end

  test "should not get edit when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get edit_carrier_path(@carrier)
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get edit when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get edit_carrier_path(@carrier)
    assert_redirected_to driver_path(@driver)
  end

  # ========== UPDATE ==========
  # test "should update carrier" do
  #   patch carrier_path(@carrier), params: { carrier: { CIN: @carrier.CIN, PAN: @carrier.PAN, PoC: @carrier.PoC, ST_num: @carrier.ST_num, address: @carrier.address, email: @carrier.email, incorporation_date: @carrier.incorporation_date, name: @carrier.name, org_type: @carrier.org_type, owner_name: @carrier.owner_name, phone: @carrier.phone, reg_date: @carrier.reg_date } }
  #   assert_redirected_to carrier_path(@carrier)
  # end

  # ========== DESTROY ==========
  test "should destroy carrier when logged in as admin" do
    login_as(@admin, :scope => :admin)
    assert_difference('Carrier.count', -1) do
      delete carrier_path(@carrier)
    end

    assert_redirected_to carriers_path
  end

  test "should not destroy carrier when not logged in" do
    assert_no_difference 'Carrier.count' do
      delete carrier_path(@carrier)
    end

    assert_redirected_to new_admin_session_path
  end

  test "should not destroy carrier when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    assert_no_difference 'Carrier.count' do
      delete carrier_path(@carrier)
    end

    assert_redirected_to carrier_path(@carrier)
  end

  test "should not destroy carrier when logged in as other carrier" do
    login_as(@other_carrier, :scope => :carrier)
    assert_no_difference 'Carrier.count' do
      delete carrier_path(@carrier)
    end

    assert_redirected_to carrier_path(@other_carrier)
  end

  test "should not destroy carrier when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    assert_no_difference 'Carrier.count' do
      delete carrier_path(@carrier)
    end

    assert_redirected_to shipper_path(@shipper)
  end

  test "should not destroy carrier when logged in as driver" do
    login_as(@driver, :scope => :driver)
    assert_no_difference 'Carrier.count' do
      delete carrier_path(@carrier)
    end

    assert_redirected_to driver_path(@driver)
  end
  # ====== DASHBOARD =======
end
