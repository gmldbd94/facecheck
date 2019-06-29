require 'test_helper'

class ChoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get 1" do
    get choice_1_url
    assert_response :success
  end

  test "should get 2" do
    get choice_2_url
    assert_response :success
  end

  test "should get 3" do
    get choice_3_url
    assert_response :success
  end

  test "should get 4" do
    get choice_4_url
    assert_response :success
  end

  test "should get 5" do
    get choice_5_url
    assert_response :success
  end

end
