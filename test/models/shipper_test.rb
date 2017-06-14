require 'test_helper'

class ShipperTest < ActiveSupport::TestCase
  setup do
    @shipper = FactoryGirl.build(:shipper)
  end
  
  test "should not be empty" do
    shipper = Shipper.new
    assert_not shipper.save
  end

  test "should have valid features" do
  	assert @shipper.save
  end

  test "should have valid email" do
    @shipper.email = ""
  	assert_not @shipper.save
  	@shipper.email = "@"
  	assert_not @shipper.save
  	@shipper.email = "@."
  	assert_not @shipper.save
    @shipper.email = "test"
  	assert_not @shipper.save
  	@shipper.email = "test@"
  	assert_not @shipper.save
  	@shipper.email = "test@"
  	assert_not @shipper.save
  end

  test "should have valid phone" do
  	@shipper.phone = "123456789"
  	assert_not @shipper.save
  	@shipper.phone = "01234567890"
  	assert_not @shipper.save
  end

  test "should have valid name" do
  	@shipper.name = ""
  	assert_not @shipper.save
  	@shipper.name = "A"
  	assert_not @shipper.save
  	@shipper.name = "AB"
  	assert_not @shipper.save
  end

  test "can have an empty address" do
  	@shipper.address = ""
  	assert @shipper.save
  end

  test "should have a valid point of contact's name" do
  	@shipper.poc = ""
  	assert_not @shipper.save
  	@shipper.poc = "A"
  	assert_not @shipper.save
  	@shipper.poc = "AS"
  	assert_not @shipper.save
  end

  test "should have a valid PAN" do
  	@shipper.PAN = "ABCDEFGH"
  	assert_not @shipper.save
    @shipper.PAN = "ABCDEFGHIJK"
    assert_not @shipper.save
  end

  test "should have a valid CIN" do
  	@shipper.CIN = "U12345AB6789CDE0123456"
  	assert_not @shipper.save, "PAN is long"
  	@shipper.CIN = "U12345AB6789CDE01234"
  	assert_not @shipper.save, "PAN is short"
  end
end
