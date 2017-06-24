require "application_system_test_case"

class CarriersTest < ApplicationSystemTestCase
  setup do
		@carrier = FactoryGirl.create(:carrier)
	end

	test "should sign in successfully" do
		visit new_carrier_session_path
		fill_in "Email", with: @carrier.email
		fill_in "Password", with: @carrier.password
		click_on "Log in"
		assert_selector "h1", text: "EffiFrei Solutions Pvt. Ltd."
	end
end
