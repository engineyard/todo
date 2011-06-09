class AddListIdToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :list_id, :integer
  end

  def self.down
    remove_column :tasks, :list_id
  end
end
