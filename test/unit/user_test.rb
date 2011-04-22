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
end
