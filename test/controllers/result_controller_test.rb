require 'test_helper'

class ResultControllerTest < ActionDispatch::IntegrationTest
  test "should get result" do
    get result_result_url
    assert_response :success
  end

end
