require 'test_helper'

class ShippersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipper = shippers(:one)
    @admin = FactoryGirl.create(:admin)
  end

  test "should get index" do
    login_as(@admin, :scope => :admin)
    get shippers_url
    assert_response :success
  end

  test "should get new" do
    login_as(@admin, :scope => :admin)
    get new_shipper_url
    assert_response :success
  end

  # test "should create shipper" do
  #   assert_difference('Shipper.count') do
  #     post shippers_url, params: { shipper: { CIN: @shipper.CIN, PAN: @shipper.PAN, ST_num: @shipper.ST_num, address: @shipper.address, email: @shipper.email, name: @shipper.name, org_type: @shipper.org_type, phone: @shipper.phone, poc: @shipper.poc, reg_date: @shipper.reg_date } }
  #   end

  #   assert_redirected_to shipper_url(Shipper.last)
  # end

  test "should show shipper" do
    get shipper_url(@shipper)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipper_url(@shipper)
    assert_response :success
  end

  # test "should update shipper" do
  #   patch shipper_url(@shipper), params: { shipper: { CIN: @shipper.CIN, PAN: @shipper.PAN, ST_num: @shipper.ST_num, address: @shipper.address, email: @shipper.email, name: @shipper.name, org_type: @shipper.org_type, phone: @shipper.phone, poc: @shipper.poc, reg_date: @shipper.reg_date } }
  #   assert_redirected_to shipper_url(@shipper)
  # end

  test "should destroy shipper" do
    login_as(@admin, :scope => :admin)
    assert_difference('Shipper.count', -1) do
      delete shipper_url(@shipper)
    end

    assert_redirected_to shippers_url
  end
end
