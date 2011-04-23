# coding: utf-8
require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  test "子どもを登録できる" do
    child = Fabricate.build(:childwithuser)
    assert child.save
    assert_not_nil child.user
  end

  test "パスワードなしでは登録できない" do
    child = Fabricate.build(:childwithuser, :password => '')
    assert !child.valid?
  end

  test "パスワード確認用が間違っていると登録できない" do
    child = Fabricate.build(:childwithuser, :password_confirmation => 'wrong')
    assert !child.valid?
  end

  test "childnameが重複していると登録できない" do
    child = Fabricate(:childwithuser)
    child2 = Fabricate.build(:child, :user => child.user, :childname => child.childname)
    assert !child2.valid?
  end

  test "self.authenticate" do
    child = Fabricate(:childwithuser)
    current_user = Child.authenticate(child.childname, child.password)
    assert_equal child, current_user
    assert !current_user.admin?
    assert current_user.child?
  end
end
