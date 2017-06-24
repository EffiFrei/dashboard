require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
	setup do
		@admin = FactoryGirl.create(:admin)
	end

	test "valid login" do
		get new_admin_session_path
		assert_template 'devise/sessions/new'
		post admin_session_path, params: { admin: {
			email:  	@admin.email,
			password: @admin.password }}
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
	end

	test "invalid login" do
		post admin_session_path, params: { admin: {
			email:  	"fsdfsd",
			password: "fdsfsd" }}
		assert_template 'devise/sessions/new'
		assert_not flash.empty?
	end
end
