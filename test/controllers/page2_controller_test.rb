require "test_helper"

class Page2ControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page2_home_url
    assert_response :success
  end
end
