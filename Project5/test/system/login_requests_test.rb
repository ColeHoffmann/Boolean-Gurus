require "application_system_test_case"

class LoginRequestsTest < ApplicationSystemTestCase
  setup do
    @login_request = login_requests(:one)
  end

  test "visiting the index" do
    visit login_requests_url
    assert_selector "h1", text: "Login Requests"
  end

  test "creating a Login request" do
    visit login_requests_url
    click_on "New Login Request"

    fill_in "Department", with: @login_request.department
    fill_in "Fname", with: @login_request.fname
    fill_in "Lname", with: @login_request.lname
    fill_in "Username", with: @login_request.username
    click_on "Create Login request"

    assert_text "Login request was successfully created"
    click_on "Back"
  end

  test "updating a Login request" do
    visit login_requests_url
    click_on "Edit", match: :first

    fill_in "Department", with: @login_request.department
    fill_in "Fname", with: @login_request.fname
    fill_in "Lname", with: @login_request.lname
    fill_in "Username", with: @login_request.username
    click_on "Update Login request"

    assert_text "Login request was successfully updated"
    click_on "Back"
  end

  test "destroying a Login request" do
    visit login_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Login request was successfully destroyed"
  end
end
