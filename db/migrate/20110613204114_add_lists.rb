class AddLists < ActiveRecord::Migration
  def self.up
  
    list = List.create(:name => 'Welcome')
    list.tasks.create(:name => 'Check out our docs http://docs.engineyard.com/ ')
    list.tasks.create(:name => 'Follow @EngineYard http://twitter.com/#!/engineyard')
    list.tasks.create(:name => 'Follow @eycloud http://twitter.com/#!/eycloud')
    list.tasks.create(:name => 'We blog http://www.engineyard.com/blog/')
    list.tasks.create(:name => 'Rock on!')
  end

  def self.down
    List.find_by_name('Test').destroy
  end
end
