class CreateWishes < ActiveRecord::Migration
  def self.up
    create_table :wishes do |t|
      t.integer :child_id
      t.integer :cost
      t.string :purpose
      t.integer :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :wishes
  end
end
