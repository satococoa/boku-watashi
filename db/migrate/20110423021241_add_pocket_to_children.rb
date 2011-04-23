class AddPocketToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :pocket, :integer
  end

  def self.down
    remove_column :children, :pocket
  end
end
