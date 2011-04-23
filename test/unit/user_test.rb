# coding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "ユーザーを作成できる" do
    user = Fabricate.build(:user)
    assert user.save
  end

  test "メールアドレスは重複不可" do
    Fabricate(:user)
    user = Fabricate.build(:user)
    assert !user.valid?
  end

  test "登録できないケース" do
    user = Fabricate.build(:user, :password => '')
    assert !user.valid?
    
    user = Fabricate.build(:user, :password_confirmation => 'wrong')
    assert !user.valid?
  end

  test "self.authenticate" do
    user = Fabricate(:user)
    current_user = User.authenticate(user.email, user.password)
    assert_equal user, current_user
    assert current_user.admin?
    assert !current_user.child?
  end

  test "childrenを登録" do
    user = Fabricate(:user)
    child = Fabricate(:child)
    user.children << child
    assert user.save
    assert user.children.first == child

    child2 = Fabricate(:child,
                       :childname => Forgery::Name.first_name,
                       :nickname => Forgery::Internet.user_name)
    user.children << child2
    assert user.save
    assert_equal 2, user.children.count
  end
end
