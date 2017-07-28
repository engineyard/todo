class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :encrypted_value

      t.timestamps null: false
    end
  end
end
