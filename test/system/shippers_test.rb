require "application_system_test_case"

class ShippersTest < ApplicationSystemTestCase
  setup do
		@shipper = FactoryGirl.create(:shipper)
	end

	test "should sign in successfully" do
		visit new_shipper_session_path
		fill_in "Email", with: @shipper.email
		fill_in "Password", with: @shipper.password
		click_on "Log in"
		assert_selector "h1", text: "EffiFrei Solutions Pvt. Ltd."
	end
end
