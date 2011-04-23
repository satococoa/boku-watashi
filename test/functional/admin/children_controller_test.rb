require 'test_helper'

class Admin::ChildrenControllerTest < ActionController::TestCase
  setup do
    @child = children(:one)
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
      @child2 = Fabricate.attributes_for(:childwithuser)
      attrs = @child.attributes
      attrs['childname'] = 'child3'
      attrs['password'] = 'child3'
      attrs['password'] = 'child3'
      %w(id password_hash password_salt created_at updated_at user_id).each do |attr|
        attrs.delete attr
      end
      post :create, :child => @child2
    end

    assert_redirected_to child_path(assigns(:child))
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
    assert_redirected_to child_path(assigns(:child))
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete :destroy, :id => @child.to_param
    end

    assert_redirected_to children_path
  end
end
