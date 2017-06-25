require 'test_helper'

class CarrierLoginTest < ActionDispatch::IntegrationTest
  setup do
		@carrier = FactoryGirl.create(:carrier)
	end

	test "valid login" do
		get new_carrier_session_path
		assert_template 'devise/sessions/new'
		post carrier_session_path, params: { carrier: {
			email:  	@carrier.email,
			password: @carrier.password }}
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
	end

	test "invalid login" do
		post carrier_session_path, params: { carrier: {
			email:  	"fsdfsd",
			password: "fdsfsd" }}
		assert_template 'devise/sessions/new'
		assert_not flash.empty?
	end
end
