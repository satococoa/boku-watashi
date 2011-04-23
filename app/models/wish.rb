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

  def self.ym_list(child)
    count = self.scoped.where(:child_id => child.id).count
    return [] if count == 0
    max_date = self.scoped.where(:child_id => child.id).maximum(:created_at)
    min_date = self.scoped.where(:child_id => child.id).minimum(:created_at)
    diff = (max_date.to_date.year - min_date.to_date.year)*12 + (max_date.to_date.month - min_date.to_date.month)
    list = []
    (0..diff).each do |i|
      list << (min_date.to_date >> i).strftime('%Y%m')
    end
    list
  end
end
