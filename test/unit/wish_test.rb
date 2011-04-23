# coding: utf-8
require 'test_helper'

class WishTest < ActiveSupport::TestCase
  test "おねがいができる" do
    wish = Fabricate(:wish)
    assert wish.persisted?
    assert_equal 0, wish.status
  end

  test "おねがいを許可できる" do
    wish = Fabricate(:wish)
    wish.status = 1
    assert wish.save
    assert_equal 1, wish.status
  end

  test "おねがいを却下できる" do
    wish = Fabricate(:wish)
    wish.status = 2
    assert wish.save
    assert_equal 2, wish.status
  end
end
