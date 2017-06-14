require 'test_helper'

class CarrierTest < ActiveSupport::TestCase
	setup do
    @carrier = FactoryGirl.build(:carrier)
  end
  
  test "should not be empty" do
    carrier = Carrier.new
    assert_not carrier.save
  end

  test "should have valid features" do
  	assert @carrier.save
  end

  test "should have valid email" do
    @carrier.email = ""
  	assert_not @carrier.save
  	@carrier.email = "@"
  	assert_not @carrier.save
  	@carrier.email = "@."
  	assert_not @carrier.save
    @carrier.email = "test"
  	assert_not @carrier.save
  	@carrier.email = "test@"
  	assert_not @carrier.save
  	@carrier.email = "test@"
  	assert_not @carrier.save
  end

  test "should have valid phone" do
  	@carrier.phone = "123456789"
  	assert_not @carrier.save
  	@carrier.phone = ""
  	assert_not @carrier.save
  end

  test "should have valid name" do
  	@carrier.name = ""
  	assert_not @carrier.save
  	@carrier.name = "A"
  	assert_not @carrier.save
  	@carrier.name = "AB"
  	assert_not @carrier.save
  end

  test "can have an empty address" do
  	@carrier.address = ""
  	assert @carrier.save
  end

  test "should have a valid owner name" do
  	@carrier.owner_name = ""
    assert_not @carrier.save
    @carrier.owner_name = "A"
    assert_not @carrier.save
    @carrier.owner_name = "AB"
    assert_not @carrier.save
  end

  test "should have a valid point of contact's name" do
  	@carrier.PoC = "AS"
  	assert_not @carrier.save
  end

  test "should have a valid PAN" do
  	@carrier.PAN = "ABCDEFGH"
  	assert_not @carrier.save
    @carrier.PAN = "ABCDEFGHIJK"
    assert_not @carrier.save
  end

  test "should have a valid CIN" do
  	@carrier.CIN = "U12345AB6789CDE0123456"
  	assert_not @carrier.save, "PAN is long"
  	@carrier.CIN = "U12345AB6789CDE01234"
  	assert_not @carrier.save, "PAN is short"
  end
end
