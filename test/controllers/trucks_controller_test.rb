require 'test_helper'

class TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = FactoryGirl.create(:request)
    @admin   = FactoryGirl.create(:admin)
    @shipper = FactoryGirl.create(:shipper)
    @carrier = FactoryGirl.create(:carrier)
    @driver  = FactoryGirl.create(:driver)
    @truck   = FactoryGirl.create(:truck)
  end

  # ========= INDEX ==========
  test "should get index when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get trucks_path
    assert_response :success
  end

  test "should get index when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get trucks_path
    assert_response :success
  end

  test "should not get index when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get trucks_path
    assert_redirected_to driver_path(@driver)
  end

  test "should not get index when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get trucks_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get index when not logged in" do
    get trucks_path
    assert_redirected_to new_carrier_session_path
  end

  # ========= NEW ==========
  test "should get new truck when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get new_truck_path
    assert_response :success
  end

  test "should get new truck when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get new_truck_path
    assert_response :success
  end

  test "should not get new truck when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get new_truck_path
    assert_redirected_to driver_path(@driver)
  end

  test "should not get new truck when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get new_truck_path
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not get new truck when not logged in" do
    get new_truck_path
    assert_redirected_to new_carrier_session_path
  end

  # ========= CREATE ==========

  # ========= SHOW ==========
  test "should show truck when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get truck_path(@truck)
    assert_response :success
  end

  test "should show truck when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get truck_path(@truck)
    assert_response :success
  end

  test "should show truck when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get truck_path(@truck)
    assert_response :success
  end

  test "should not show truck when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get truck_path(@truck)
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not show truck when not logged in" do
    get truck_path(@truck)
    assert_redirected_to new_carrier_session_path
  end

  # ========= EDIT ==========
  test "should edit truck when logged in as admin" do
    login_as(@admin, :scope => :admin)
    get edit_truck_path(@truck)
    assert_response :success
  end

  test "should edit truck when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    get edit_truck_path(@truck)
    assert_response :success
  end

  test "should not edit truck when logged in as driver" do
    login_as(@driver, :scope => :driver)
    get edit_truck_path(@truck)
    assert_redirected_to driver_path(@driver)
  end

  test "should not edit truck when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    get edit_truck_path(@truck)
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not edit truck when not logged in" do
    get edit_truck_path(@truck)
    assert_redirected_to new_carrier_session_path
  end

  # ========= UPDATE ==========
  test "should update truck when logged in as admin" do
    login_as(@admin, :scope => :admin)
    patch truck_path(@truck), params: { truck: { body_type: @truck.body_type, chasis_num: @truck.chasis_num, current_location: @truck.current_location, current_status: @truck.current_status, engine_num: @truck.engine_num, fitness: @truck.fitness, gross_vehicle_weight: @truck.gross_vehicle_weight, insurance_expiry: @truck.insurance_expiry, insurer: @truck.insurer, load_base_length: @truck.load_base_length, load_capacity: @truck.load_capacity, load_height: @truck.load_height, load_width: @truck.load_width, manufacturer: @truck.manufacturer, model: @truck.model, permit_expiry: @truck.permit_expiry, policy_num: @truck.policy_num, purchase_date: @truck.purchase_date, registration_auth: @truck.registration_auth, registration_num: @truck.registration_num, unloaded_weight: @truck.unloaded_weight } }
    assert_redirected_to truck_path(@truck)
  end

  test "should update truck when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    patch truck_path(@truck), params: { truck: { body_type: @truck.body_type, chasis_num: @truck.chasis_num, current_location: @truck.current_location, current_status: @truck.current_status, engine_num: @truck.engine_num, fitness: @truck.fitness, gross_vehicle_weight: @truck.gross_vehicle_weight, insurance_expiry: @truck.insurance_expiry, insurer: @truck.insurer, load_base_length: @truck.load_base_length, load_capacity: @truck.load_capacity, load_height: @truck.load_height, load_width: @truck.load_width, manufacturer: @truck.manufacturer, model: @truck.model, permit_expiry: @truck.permit_expiry, policy_num: @truck.policy_num, purchase_date: @truck.purchase_date, registration_auth: @truck.registration_auth, registration_num: @truck.registration_num, unloaded_weight: @truck.unloaded_weight } }
    assert_redirected_to truck_path(@truck)
  end

  test "should not update truck when logged in as driver" do
    login_as(@driver, :scope => :driver)
    patch truck_path(@truck), params: { truck: { body_type: @truck.body_type, chasis_num: @truck.chasis_num, current_location: @truck.current_location, current_status: @truck.current_status, engine_num: @truck.engine_num, fitness: @truck.fitness, gross_vehicle_weight: @truck.gross_vehicle_weight, insurance_expiry: @truck.insurance_expiry, insurer: @truck.insurer, load_base_length: @truck.load_base_length, load_capacity: @truck.load_capacity, load_height: @truck.load_height, load_width: @truck.load_width, manufacturer: @truck.manufacturer, model: @truck.model, permit_expiry: @truck.permit_expiry, policy_num: @truck.policy_num, purchase_date: @truck.purchase_date, registration_auth: @truck.registration_auth, registration_num: @truck.registration_num, unloaded_weight: @truck.unloaded_weight } }
    assert_redirected_to driver_path(@driver)
  end

  test "should not update truck when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    patch truck_path(@truck), params: { truck: { body_type: @truck.body_type, chasis_num: @truck.chasis_num, current_location: @truck.current_location, current_status: @truck.current_status, engine_num: @truck.engine_num, fitness: @truck.fitness, gross_vehicle_weight: @truck.gross_vehicle_weight, insurance_expiry: @truck.insurance_expiry, insurer: @truck.insurer, load_base_length: @truck.load_base_length, load_capacity: @truck.load_capacity, load_height: @truck.load_height, load_width: @truck.load_width, manufacturer: @truck.manufacturer, model: @truck.model, permit_expiry: @truck.permit_expiry, policy_num: @truck.policy_num, purchase_date: @truck.purchase_date, registration_auth: @truck.registration_auth, registration_num: @truck.registration_num, unloaded_weight: @truck.unloaded_weight } }
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not update truck when not logged in" do
    patch truck_path(@truck), params: { truck: { body_type: @truck.body_type, chasis_num: @truck.chasis_num, current_location: @truck.current_location, current_status: @truck.current_status, engine_num: @truck.engine_num, fitness: @truck.fitness, gross_vehicle_weight: @truck.gross_vehicle_weight, insurance_expiry: @truck.insurance_expiry, insurer: @truck.insurer, load_base_length: @truck.load_base_length, load_capacity: @truck.load_capacity, load_height: @truck.load_height, load_width: @truck.load_width, manufacturer: @truck.manufacturer, model: @truck.model, permit_expiry: @truck.permit_expiry, policy_num: @truck.policy_num, purchase_date: @truck.purchase_date, registration_auth: @truck.registration_auth, registration_num: @truck.registration_num, unloaded_weight: @truck.unloaded_weight } }
    assert_redirected_to new_carrier_session_path
  end

  # ========= DESTROY ==========
  test "should destroy truck when logged in as admin" do
    login_as(@admin, :scope => :admin)
    assert_difference('Truck.count', -1) do
      delete truck_path(@truck)
    end
    assert_redirected_to trucks_path
  end

  test "should destroy truck when logged in as carrier" do
    login_as(@carrier, :scope => :carrier)
    assert_difference('Truck.count', -1) do
      delete truck_path(@truck)
    end
    assert_redirected_to trucks_path
  end

  test "should not destroy truck when logged in as driver" do
    login_as(@driver, :scope => :driver)
    assert_no_difference 'Truck.count' do
      delete truck_path(@truck)
    end
    assert_redirected_to driver_path(@driver)
  end

  test "should not destroy truck when logged in as shipper" do
    login_as(@shipper, :scope => :shipper)
    assert_no_difference 'Truck.count' do
      delete truck_path(@truck)
    end
    assert_redirected_to shipper_path(@shipper)
  end

  test "should not destroy truck when not logged in" do
    assert_no_difference 'Truck.count' do
      delete truck_path(@truck)
    end
    assert_redirected_to new_carrier_session_path
  end
end