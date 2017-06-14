require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
    @admin = FactoryGirl.create(:admin)
  end

  test "should get new" do
    login_as(@admin, :scope => :admin)
    get new_request_url
    assert_response :success
  end

  test "should get index" do
    login_as(@admin, :scope => :admin)
    get requests_url
    assert_response :success
  end

  test "should get show" do
    login_as(@admin, :scope => :admin)
    get request_url(@request)
    assert_response :success
  end

  test "should get edit" do
    login_as(@admin, :scope => :admin)
    get edit_request_url(@request)
    assert_response :success
  end

  test "should get destroy" do
    login_as(@admin, :scope => :admin)
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end
    assert_redirected_to requests_url
  end

end
