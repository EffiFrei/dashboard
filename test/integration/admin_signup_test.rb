require 'test_helper'

class AdminSignupTest < ActionDispatch::IntegrationTest
  test "valid signup" do
  	get new_admin_registration_path
  	assert_difference 'Admin.count', 1 do
      post admins_path, params: { admin: {
      	name: 								 "Example Admin",
      	phone: 								 "1234567890",
      	email: 								 "admin@example.com",
    		password:              "password",
      	password_confirmation: "password" }}
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_template "static_pages/home"
  end

  test "invalid signup" do
  	get new_admin_registration_path
  	assert_no_difference 'Admin.count', 1 do
      post admins_path, params: { admin: {
      	name: 								 "Example Admin",
      	email: 								 "admin@example.com",
    		password:              "password",
      	password_confirmation: "password" }}
    end
    assert_template "admins/registrations/new"
  end
end
