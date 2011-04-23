require 'test_helper'

class Admin::WishesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get approve" do
    get :approve
    assert_response :success
  end

  test "should get reject" do
    get :reject
    assert_response :success
  end

end
