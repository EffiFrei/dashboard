require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "should not be empty" do
    admin = Admin.new
    assert_not admin.save
  end

  test "should have valid features" do
    admin = FactoryGirl.build(:admin)
  	assert admin.save
  end

  test "should have valid email" do
    admin = FactoryGirl.build(:admin)
    admin.email = ""
  	assert_not admin.save
  	admin.email = "@"
  	assert_not admin.save
  	admin.email = "@."
  	assert_not admin.save
    admin.email = "test"
  	assert_not admin.save
  	admin.email = "test@"
  	assert_not admin.save
  	admin.email = "test@"
  	assert_not admin.save
  end

  test "should have valid phone" do
  	admin = FactoryGirl.build(:admin)
  	admin.phone = "123456789"
  	assert_not admin.save
  	admin.phone = ""
  	assert_not admin.save
  end

  test "should not have empty name" do
  	admin = FactoryGirl.build(:admin)
  	admin.name = ""
  	assert_not admin.save
  end

  test "can have empty address" do
  	admin = FactoryGirl.build(:admin)
  	admin.address = ""
  	assert admin.save
  end
end
