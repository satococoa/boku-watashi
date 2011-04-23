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
    rs = select("max(created_at) as max, min(created_at) as min").where(:child_id => child.id)
    return [] if rs.count == 0
    row = rs.first
    diff = (row.max.to_date.year - row.min.to_date.year)*12 + (row.max.to_date.month - row.min.to_date.month)
    list = []
    (0..diff).each do |i|
      list << (row.min.to_date >> i).strftime('%Y%m')
    end
    list
  end
end
