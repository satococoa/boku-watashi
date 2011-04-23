require 'test_helper'

class Admin::WishesControllerTest < ActionController::TestCase
  setup do
    @user = Fabricate(:user)
    @child = Fabricate(:child, :user => @user)
    login_as_user(@user)
    @wish = Fabricate(:wish, :child => @child)
  end

  test "should get index" do
    get :index, :child_id => @child.id
    assert_response :success
  end

  test "should put approve" do
    put :approve, :child_id => @child.id, :id => @wish.to_param, :wish => @wish.attributes
    assert_redirected_to admin_child_wishes_path(assigns(:wishes))
  end

  test "should put reject" do
    put :reject, :child_id => @child.id, :id => @wish.to_param, :wish => @wish.attributes
    assert_redirected_to admin_child_wishes_path(assigns(:wishes))
  end

end
