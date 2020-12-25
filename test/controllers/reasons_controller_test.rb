require 'test_helper'

class ReasonsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reasons_create_url
    assert_response :success
  end

end
