require "application_system_test_case"

class DriversTest < ApplicationSystemTestCase
  setup do
		@driver = FactoryGirl.create(:driver)
	end

	test "should sign in successfully" do
		visit new_driver_session_path
		fill_in "Email", with: @driver.email
		fill_in "Password", with: @driver.password
		click_on "Log in"
		assert_selector "h1", text: "EffiFrei Solutions Pvt. Ltd."
	end
end
