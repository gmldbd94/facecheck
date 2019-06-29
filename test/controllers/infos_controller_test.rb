require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infos_index_url
    assert_response :success
  end

  test "should get deal" do
    get infos_deal_url
    assert_response :success
  end

end
