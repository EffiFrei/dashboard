require 'test_helper'

class ShipperSignupTest < ActionDispatch::IntegrationTest
	test "valid signup" do
		get new_shipper_registration_path
		assert_difference 'Shipper.count', 1 do
			post shippers_path, params: { shipper: {
				email: 								 "shipper@example.com",
				password:              "password",
				password_confirmation: "password" }}
		end
		assert_redirected_to root_path
		follow_redirect!
		assert_template "static_pages/home"
	end

	test "invalid signup" do
		get new_shipper_registration_path
		assert_no_difference 'Shipper.count', 1 do
			post shippers_path, params: { shipper: {
				email: 								 "shipper@example.com",
				password:              "passwoord",
				password_confirmation: "password" }}
		end
		assert_template "devise/registrations/new"
	end
end
