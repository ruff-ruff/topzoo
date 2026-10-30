require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get role" do
    get sessions_role_url
    assert_response :success
  end

  test "should get login" do
    get sessions_login_url
    assert_response :success
  end
end
