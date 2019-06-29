require 'test_helper'

class ScafdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scafd = scafds(:one)
  end

  test "should get index" do
    get scafds_url
    assert_response :success
  end

  test "should get new" do
    get new_scafd_url
    assert_response :success
  end

  test "should create scafd" do
    assert_difference('Scafd.count') do
      post scafds_url, params: { scafd: { title: @scafd.title } }
    end

    assert_redirected_to scafd_url(Scafd.last)
  end

  test "should show scafd" do
    get scafd_url(@scafd)
    assert_response :success
  end

  test "should get edit" do
    get edit_scafd_url(@scafd)
    assert_response :success
  end

  test "should update scafd" do
    patch scafd_url(@scafd), params: { scafd: { title: @scafd.title } }
    assert_redirected_to scafd_url(@scafd)
  end

  test "should destroy scafd" do
    assert_difference('Scafd.count', -1) do
      delete scafd_url(@scafd)
    end

    assert_redirected_to scafds_url
  end
end
