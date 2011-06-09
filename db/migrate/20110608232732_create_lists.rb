class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
