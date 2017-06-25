require 'test_helper'

class DriverSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup" do
		get new_driver_registration_path
		assert_no_difference 'Driver.count' do
			post drivers_path, params: { driver: {
				email: 								 "driver@example.com",
				password:              "password",
				password_confirmation: "password" }}
		end
		assert_template "devise/registrations/new"
	end
end
