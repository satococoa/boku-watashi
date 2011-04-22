class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.integer :user_id
      t.string :childname
      t.string :nickname
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
