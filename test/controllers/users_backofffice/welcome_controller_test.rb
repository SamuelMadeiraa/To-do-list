require "test_helper"

class UsersBackofffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backofffice_welcome_index_url
    assert_response :success
  end
end
