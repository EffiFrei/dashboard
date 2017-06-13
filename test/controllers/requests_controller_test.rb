require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test "should get new" do
    get new_request_url
    assert_response :success
  end

  test "should get index" do
    get requests_url
    assert_response :success
  end

  test "should get show" do
    get request_url(@request)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_url(@request)
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end
    assert_redirected_to requests_url
  end

end
