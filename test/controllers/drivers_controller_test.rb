require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = FactoryGirl.create(:driver)
    @admin = FactoryGirl.create(:admin)
  end

  # ====== INDEX =======
  test "should get index when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get drivers_url
    assert_response :success
  end

  # ====== NEW =======
  test "should get new when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get new_driver_url
    assert_response :success
  end

  # test "should create driver" do
  #   assert_difference('Driver.count') do
  #     post drivers_url, params: { driver: { DL: @driver.DL, DL_expiry: @driver.DL_expiry, DL_issue_date: @driver.DL_issue_date, DOB: @driver.DOB, address: @driver.address, blood_group: @driver.blood_group, name: @driver.name } }
  #   end

  #   assert_redirected_to driver_url(Driver.last)
  # end

  # ====== SHOW =======
  test "should show driver when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get driver_url(@driver)
    assert_response :success
  end

  # ====== EDIT =======
  test "should get edit when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get edit_driver_url(@driver)
    assert_response :success
  end

  # test "should update driver" do
  #   patch driver_url(@driver), params: { driver: { DL: @driver.DL, DL_expiry: @driver.DL_expiry, DL_issue_date: @driver.DL_issue_date, DOB: @driver.DOB, address: @driver.address, blood_group: @driver.blood_group, name: @driver.name } }
  #   assert_redirected_to driver_url(@driver)
  # end

  # ====== DELETE =======
  test "should destroy driver when logged in as admin" do
    login_as(@admin, :scope => :admin)
    assert_difference('Driver.count', -1) do
      delete driver_url(@driver)
    end

    assert_redirected_to drivers_url
  end
end
