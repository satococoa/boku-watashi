# coding: utf-8
class Wish < ActiveRecord::Base
  belongs_to :child
  attr_accessible :cost, :purpose

  Status = { 0 => 'まだ', 1 => 'いいよ', 2 => 'ダメ' }

  validates :cost, :presence => true, :numericality => {:only_integer => true}
  validates :purpose, :presence => true
  validates :status, :inclusion => {:in => Status}
  
  default_scope order(:created_at)
  scope :approved, where(:status => 1)
  scope :not_approved, where(:status => 2)
  scope :monthly, lambda {|ym|
    if ym.blank?
      today = Date.today
      year, month = today.year, today.month
    else
      year, month = ym[0..3].to_i, ym[4..-1].to_i
    end
    d = Date.new(year, month)
    where(:created_at => (d.to_date)...((d>>1).to_date))
  }

  scope :cost_summary, sum(:cost)
end
