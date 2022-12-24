require "test_helper"

class LogControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get log_sign_in_url
    assert_response :success
  end

  test "should get sign_out" do
    get log_sign_out_url
    assert_response :success
  end
end
