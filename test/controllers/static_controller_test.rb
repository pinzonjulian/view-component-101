require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get root_path" do
    get root_path
    assert_response :success
  end

end
