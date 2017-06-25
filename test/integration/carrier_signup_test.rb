require 'test_helper'

class CarrierSignupTest < ActionDispatch::IntegrationTest
	test "valid signup" do
		get new_carrier_registration_path
		assert_difference 'Carrier.count', 1 do
			post carriers_path, params: { carrier: {
				email: 								 "carrier@example.com",
				password:              "password",
				password_confirmation: "password" }}
		end
		assert_redirected_to root_path
		follow_redirect!
		assert_template "static_pages/home"
	end

	test "invalid signup" do
		get new_carrier_registration_path
		assert_no_difference 'Carrier.count', 1 do
			post carriers_path, params: { carrier: {
				email: 								 "carrier@example.com",
				password:              "passwoord",
				password_confirmation: "password" }}
		end
		assert_template "devise/registrations/new"
	end
end
