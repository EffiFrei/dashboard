require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  setup do
    @request = FactoryGirl.build(:request)
  end
  
  test "should not be empty" do
    request = Request.new
    assert_not request.save
  end

  test "should have valid features" do
  	assert @request.save
  end

  test "should have valid phone of source PoC" do
  	@request.phone_src = "123456789"
  	assert_not @request.save
  	@request.phone_src = ""
  	assert_not @request.save
  end

  test "should have valid phone of destination PoC" do
  	@request.phone_dest = "123456789"
  	assert_not @request.save
  	@request.phone_dest = ""
  	assert_not @request.save
  end

  test "should have a valid source PoC name" do
  	@request.poc_src = ""
  	assert_not @request.save
  	@request.poc_src = "A"
  	assert_not @request.save
  	@request.poc_src = "AB"
  	assert_not @request.save
  end

  test "should have a valid destination PoC name" do
  	@request.poc_dest = ""
  	assert_not @request.save
  	@request.poc_dest = "A"
  	assert_not @request.save
  	@request.poc_dest = "AB"
  	assert_not @request.save
  end

  test "should have a valid source" do
  	@request.source = ""
  	assert_not @request.save
  end

  test "should have a valid destination" do
  	@request.destination = ""
  	assert_not @request.save
  end

  test "shipper id should be present" do
    @request.shipper_id = nil
    assert_not @request.valid?
  end

end
