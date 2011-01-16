require 'test_helper'

class HostelsControllerTest < ActionController::TestCase
  test "should get select_country" do
    get :select_country
    assert_response :success
  end

  test "should get select_city" do
    get :select_city
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
