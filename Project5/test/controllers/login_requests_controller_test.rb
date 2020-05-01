require 'test_helper'

class LoginRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login_request = login_requests(:one)
  end

  test "should get index" do
    get login_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_login_request_url
    assert_response :success
  end

  test "should create login_request" do
    assert_difference('LoginRequest.count') do
      post login_requests_url, params: { login_request: { department: @login_request.department, fname: @login_request.fname, lname: @login_request.lname, username: @login_request.username } }
    end

    assert_redirected_to login_request_url(LoginRequest.last)
  end

  test "should show login_request" do
    get login_request_url(@login_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_login_request_url(@login_request)
    assert_response :success
  end

  test "should update login_request" do
    patch login_request_url(@login_request), params: { login_request: { department: @login_request.department, fname: @login_request.fname, lname: @login_request.lname, username: @login_request.username } }
    assert_redirected_to login_request_url(@login_request)
  end

  test "should destroy login_request" do
    assert_difference('LoginRequest.count', -1) do
      delete login_request_url(@login_request)
    end

    assert_redirected_to login_requests_url
  end
end
