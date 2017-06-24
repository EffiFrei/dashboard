require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = FactoryGirl.build(:admin)
  end

  test "should not be empty" do
    admin = Admin.new
    assert_not admin.valid?
  end

  test "should have valid features" do
  	assert @admin.valid?
  end

  test "should have valid email" do
    @admin.email = ""
    assert_not @admin.valid?
    @admin.email = "@"
    assert_not @admin.valid?
    @admin.email = "@."
    assert_not @admin.valid?
    @admin.email = "test"
    assert_not @admin.valid?
    @admin.email = "test@"
    assert_not @admin.valid?
    @admin.email = "test@"
    assert_not @admin.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[admin@example.com admin@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @admin.email = valid_address
      assert @admin.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email should not be too long" do
    @admin.email = "a" * 244 + "@example.com"
    assert_not @admin.valid?
  end

  test "email address should be unique" do
    duplicate_admin = @admin.dup
    duplicate_admin.email = @admin.email.upcase
    @admin.save
    assert_not duplicate_admin.valid?
  end

  test "should have valid phone" do
    @admin.phone = "12345678901"
    assert_not @admin.valid?
    @admin.phone = "123456789"
  	assert_not @admin.valid?
  	@admin.phone = ""
  	assert_not @admin.valid?
  end

  test "should have valid name" do
    @admin.name = ""
    assert_not @admin.valid?
    @admin.name = "   "
    assert_not @admin.valid?
    @admin.name = "A"
    assert_not @admin.valid?
    @admin.name = "AB"
    assert_not @admin.valid?
  end

  test "can have a non-empty address" do
  	@admin.address = "  "
  	assert @admin.valid?
  end

  test "address should not be too long" do
    @admin.address = "a" * 501
    assert_not @admin.valid?
  end

  test "password should be present (nonblank)" do
    @admin.password = @admin.password_confirmation = " " * 6
    assert_not @admin.valid?
  end

  test "password should have a minimum length" do
    @admin.password = @admin.password_confirmation = "a" * 5
    assert_not @admin.valid?
  end
end
