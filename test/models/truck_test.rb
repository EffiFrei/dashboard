require 'test_helper'

class TruckTest < ActiveSupport::TestCase
	setup do
    @truck = FactoryGirl.build(:truck)
  end

  test "should not be empty" do
    truck = Truck.new
    assert_not truck.save
  end

  test "should have valid features" do
  	assert @truck.save
  end

  test "should have valid registration_num" do
  	@truck.registration_num = ""
  	assert_not @truck.save
  end

  test "should have valid engine_num" do
  	@truck.engine_num = ""
  	assert_not @truck.save
  end

  test "should have valid chasis_num" do
  	@truck.chasis_num = ""
  	assert_not @truck.save
  end

  test "should have valid manufacturer" do
  	@truck.manufacturer = ""
  	assert_not @truck.save
  end

  test "should have valid model" do
  	@truck.model = ""
  	assert_not @truck.save
  end

  test "should have valid load_capacity" do
  	@truck.load_capacity = ""
  	assert_not @truck.save
  end

  test "carrier id should be present" do
    @truck.carrier_id = nil
    assert_not @truck.valid?
  end
end
