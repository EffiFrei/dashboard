require 'test_helper'

class CarriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrier = carriers(:one)
    @admin = FactoryGirl.create(:admin)
  end

  test "should get index" do
    login_as(@admin, :scope => :admin)
    get carriers_url
    assert_response :success
  end

  test "should get new" do
    login_as(@admin, :scope => :admin)
    get new_carrier_url
    assert_response :success
  end

  # test "should create carrier" do
  #   assert_difference('Carrier.count') do
  #     post carriers_url, params: { carrier: { CIN: @carrier.CIN, PAN: @carrier.PAN, PoC: @carrier.PoC, ST_num: @carrier.ST_num, address: @carrier.address, email: @carrier.email, incorporation_date: @carrier.incorporation_date, name: @carrier.name, org_type: @carrier.org_type, owner_name: @carrier.owner_name, phone: @carrier.phone, reg_date: @carrier.reg_date } }
  #   end

  #   assert_redirected_to carrier_url(Carrier.last)
  # end

  test "should show carrier" do
    get carrier_url(@carrier)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrier_url(@carrier)
    assert_response :success
  end

  # test "should update carrier" do
  #   patch carrier_url(@carrier), params: { carrier: { CIN: @carrier.CIN, PAN: @carrier.PAN, PoC: @carrier.PoC, ST_num: @carrier.ST_num, address: @carrier.address, email: @carrier.email, incorporation_date: @carrier.incorporation_date, name: @carrier.name, org_type: @carrier.org_type, owner_name: @carrier.owner_name, phone: @carrier.phone, reg_date: @carrier.reg_date } }
  #   assert_redirected_to carrier_url(@carrier)
  # end

  test "should destroy carrier" do
    login_as(@admin, :scope => :admin)
    assert_difference('Carrier.count', -1) do
      delete carrier_url(@carrier)
    end

    assert_redirected_to carriers_url
  end
end
