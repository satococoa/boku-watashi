require 'test_helper'

class Admin::ChildrenControllerTest < ActionController::TestCase
  setup do
    @user = Fabricate(:user)
    @child = Fabricate(:child, :user => @user)
    login_as_user(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child" do
    assert_difference('Child.count') do
      @child2 = Fabricate.attributes_for(:child2, :user => @user)
      post :create, :child => @child2
    end

    assert_redirected_to admin_child_path(assigns(:child))
  end

  test "should show child" do
    get :show, :id => @child.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @child.to_param
    assert_response :success
  end

  test "should update child" do
    put :update, :id => @child.to_param, :child => @child.attributes
    assert_redirected_to admin_child_path(assigns(:child))
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete :destroy, :id => @child.to_param
    end

    assert_redirected_to admin_children_path
  end
end
