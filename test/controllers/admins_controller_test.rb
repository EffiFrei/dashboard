require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@admin 	 		 = FactoryGirl.create(:admin)
		@shipper 		 = FactoryGirl.create(:shipper)
		@carrier 		 = FactoryGirl.create(:carrier)
		@driver  		 = FactoryGirl.create(:driver)
		@other_admin = FactoryGirl.create(:admin)
	end

	# ====== INDEX =======
	test 'should get index when logged in as admin' do
		login_as(@admin, :scope => :admin)
		get admins_path
		assert_response :success
	end

	test 'should not get index when not logged in' do
		get admins_path
		assert_redirected_to new_admin_session_path
	end

	test 'should not get index when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		get admins_path
		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not get index when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		get admins_path
		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not get index when logged in as driver' do
		login_as(@driver, :scope => :driver)
		get admins_path
		assert_redirected_to driver_path(@driver)
	end

	# ====== EDIT =======
	test 'should get edit when logged in as admin' do
		login_as(@admin, :scope => :admin)
		get edit_admin_path(@admin)
		assert_response :success
	end

	test 'should not get edit when not logged in' do
		get edit_admin_path(@admin)
		assert_redirected_to new_admin_session_path
	end

	test 'should get edit when other admin is logged in' do
		login_as(@other_admin, :scope => :admin)
		get edit_admin_path(@admin)
		assert_response :success
	end

	test 'should not get edit when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		get edit_admin_path(@admin)
		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not get edit when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		get edit_admin_path(@admin)
		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not get edit when logged in as driver' do
		login_as(@driver, :scope => :driver)
		get edit_admin_path(@admin)
		assert_redirected_to driver_path(@driver)
	end

	# ====== SHOW =======
	test 'should show admin when logged in as admin' do
		login_as(@admin, :scope => :admin)
		get admin_path(@admin)
		assert_response :success
	end

	test 'should not show admin when not logged in' do
		get admin_path(@admin)
		assert_redirected_to new_admin_session_path
	end

	test 'should not show admin when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		get admin_path(@admin)
		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not show admin when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		get admin_path(@admin)
		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not show admin when logged in as driver' do
		login_as(@driver, :scope => :driver)
		get admin_path(@admin)
		assert_redirected_to driver_path(@driver)
	end

	# ====== DASHBOARD =======
	test 'should get dashboard when logged in as admin' do
		login_as(@admin, :scope => :admin)
		get admin_dash_path
		assert_response :success
	end

	test 'should not get dashboard when not logged in' do
		get admin_dash_path
		assert_redirected_to new_admin_session_path
	end

	test 'should not get dashboard when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		get admin_dash_path
		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not get dashboard when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		get admin_dash_path
		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not get dashboard when logged in as driver' do
		login_as(@driver, :scope => :driver)
		get admin_dash_path
		assert_redirected_to driver_path(@driver)
	end

	# ====== NEW =======
	test 'should get new when logged in as admin' do
		login_as(@admin, :scope => :admin)
		get new_admin_path
		assert_response :success
	end

	test 'should not get new when not logged in' do
		get new_admin_path
		assert_redirected_to new_admin_session_path
	end

	test 'should not get new when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		get new_admin_path
		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not get new when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		get new_admin_path
		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not get new when logged in as driver' do
		login_as(@driver, :scope => :driver)
		get new_admin_path
		assert_redirected_to driver_path(@driver)
	end

	# ====== DELETE =======
	test 'should delete other admin when logged in as admin' do
		login_as(@admin, :scope => :admin)

		assert_difference('Admin.count', -1) do
			delete admin_path(@other_admin)
		end

		assert_redirected_to admins_path
	end

	test 'should not delete when not logged in' do
		assert_no_difference 'Admin.count' do
			delete admin_path(@other_admin)
		end

		assert_redirected_to new_admin_session_path
	end

	test 'should not delete when logged in as carrier' do
		login_as(@carrier, :scope => :carrier)
		assert_no_difference 'Admin.count' do
			delete admin_path(@other_admin)
		end

		assert_redirected_to carrier_path(@carrier)
	end

	test 'should not delete when logged in as shipper' do
		login_as(@shipper, :scope => :shipper)
		assert_no_difference 'Admin.count' do
			delete admin_path(@other_admin)
		end

		assert_redirected_to shipper_path(@shipper)
	end

	test 'should not delete when logged in as driver' do
		login_as(@driver, :scope => :driver)
		assert_no_difference 'Admin.count' do
			delete admin_path(@other_admin)
		end

		assert_redirected_to driver_path(@driver)
	end
	# ====== CREATE =======
	# ====== UPDATE =======
end
