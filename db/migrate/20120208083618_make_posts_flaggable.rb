class MakePostsFlaggable < ActiveRecord::Migration
  def self.up
    add_column :posts, :contacted, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :posts, :contacted
  end
end
