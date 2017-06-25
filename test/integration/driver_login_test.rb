require 'test_helper'

class DriverLoginTest < ActionDispatch::IntegrationTest
	setup do
		@driver = FactoryGirl.create(:driver)
	end

	test "valid login" do
		get new_driver_session_path
		assert_template 'devise/sessions/new'
		post driver_session_path, params: { driver: {
			email:  	@driver.email,
			password: @driver.password }}
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
	end

	test "invalid login" do
		post driver_session_path, params: { driver: {
			email:  	"fsdfsd",
			password: "fdsfsd" }}
		assert_template 'devise/sessions/new'
		assert_not flash.empty?
	end
end
