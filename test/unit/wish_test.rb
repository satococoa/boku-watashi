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

  test "self.ym_list" do
    wish = Fabricate(:wish)
    child = wish.child
    assert_equal [Date.today.strftime('%Y%m')], child.wishes.ym_list(child)

    today = Date.today
    ((today+1)..(today>>3)).each do |date|
      tmp_wish = Fabricate(:wish, :child => child)
      tmp_wish.created_at = date
      tmp_wish.save
    end
    list = []
    (0..3).each do |i|
      list << (today >> i).strftime('%Y%m')
    end
    assert_equal list, child.wishes.ym_list(child)
  end
end
