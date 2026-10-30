require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get role" do
    get session_role_url
    assert_response :success
  end
end
