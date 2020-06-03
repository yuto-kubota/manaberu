require 'test_helper'

class GivingSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get giving_sessions_new_url
    assert_response :success
  end

end
