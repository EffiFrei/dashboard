require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  setup do
    @driver = FactoryGirl.build(:driver)
  end
  
  test "should not be empty" do
    driver = Driver.new
    assert_not driver.save
  end

  test "should have valid features" do
  	assert @driver.save
  end

  test "should have valid email" do
    @driver.email = ""
  	assert_not @driver.save
  	@driver.email = "@"
  	assert_not @driver.save
  	@driver.email = "@."
  	assert_not @driver.save
    @driver.email = "test"
  	assert_not @driver.save
  	@driver.email = "test@"
  	assert_not @driver.save
  	@driver.email = "test@"
  	assert_not @driver.save
  end

  test "should have valid phone" do
  	@driver.phone = "123456789"
  	assert_not @driver.save
  	@driver.phone = ""
  	assert_not @driver.save
  end

  test "should have a valid name" do
  	@driver.name = ""
  	assert_not @driver.save
  	@driver.name = "A"
  	assert_not @driver.save
  	@driver.name = "AB"
  	assert_not @driver.save
  end

  test "should have a valid DL" do
  	@driver.DL = "AB012345678901"
  	assert_not @driver.save
    @driver.DL = "AB01234567890123"
    assert_not @driver.save
  end
end
