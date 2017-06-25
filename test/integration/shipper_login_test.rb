require 'test_helper'

class ShipperLoginTest < ActionDispatch::IntegrationTest
setup do
		@shipper = FactoryGirl.create(:shipper)
	end

	test "valid login" do
		get new_shipper_session_path
		assert_template 'devise/sessions/new'
		post shipper_session_path, params: { shipper: {
			email:  	@shipper.email,
			password: @shipper.password }}
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
	end

	test "invalid login" do
		post shipper_session_path, params: { shipper: {
			email:  	"fsdfsd",
			password: "fdsfsd" }}
		assert_template 'devise/sessions/new'
		assert_not flash.empty?
	end
end
