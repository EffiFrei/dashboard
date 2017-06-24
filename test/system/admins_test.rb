require "application_system_test_case"

class AdminsTest < ApplicationSystemTestCase
	setup do
		@admin = FactoryGirl.create(:admin)
		visit new_admin_session_path
		fill_in "Email", with: @admin.email
		fill_in "Password", with: @admin.password
		click_on "Log in"
		assert_selector "h1", text: "EffiFrei Solutions Pvt. Ltd."
	end

	test "should log out successfully" do
		visit root_path
		click_on "Logout"
		assert_selector "a", text: "Admin"
	end

	test "should see all header links" do
		assert_selector 'a', text: 'Profile'
		assert_selector 'a', text: "EffiFrei"
	end

	test "should see all links in profile page" do
		visit admin_path(@admin)
		# assert_template 'admins/show'
		assert_selector 'a', text: 'Edit'
		assert_selector 'td', text: @admin.name
		assert_selector 'td', text: @admin.email
		assert_selector 'td', text: @admin.phone
		assert_selector 'td', text: @admin.address
	end
end
