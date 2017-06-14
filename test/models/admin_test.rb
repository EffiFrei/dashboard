require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = FactoryGirl.build(:admin)
  end

  test "should not be empty" do
    admin = Admin.new
    assert_not admin.save
  end

  test "should have valid features" do
  	assert @admin.save
  end

  test "should have valid email" do
    @admin.email = ""
  	assert_not @admin.save
  	@admin.email = "@"
  	assert_not @admin.save
  	@admin.email = "@."
  	assert_not @admin.save
    @admin.email = "test"
  	assert_not @admin.save
  	@admin.email = "test@"
  	assert_not @admin.save
  	@admin.email = "test@"
  	assert_not @admin.save
  end

  test "should have valid phone" do
  	@admin.phone = "123456789"
  	assert_not @admin.save
  	@admin.phone = ""
  	assert_not @admin.save
  end

  test "should have valid name" do
    @admin.name = ""
    assert_not @admin.save
    @admin.name = "A"
    assert_not @admin.save
    @admin.name = "AB"
    assert_not @admin.save
  end

  test "can have empty address" do
  	@admin.address = ""
  	assert @admin.save
  end
end
