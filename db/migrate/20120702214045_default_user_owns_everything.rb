class DefaultUserOwnsEverything < ActiveRecord::Migration
  def self.up
    default_user = User.create(:name => 'Default User')
    
    add_column :lists, :user_id, :integer
    add_column :tasks, :user_id, :integer
    
    List.update_all("user_id = #{default_user.id}")
    Task.update_all("user_id = #{default_user.id}")
  end

  def self.down
    remove_column :tasks, :user_id
    remove_column :lists, :user_id
    
    User.find_all_by_name('Default User').map(&:destroy)
  end
end