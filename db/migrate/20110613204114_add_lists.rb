class AddLists < ActiveRecord::Migration
  def self.up
    List.create(:name => 'Inbox')
    list = List.create(:name => 'Getting Started')
    list.tasks.create(:name => 'Cool task')
  end

  def self.down
    List.find_by_name('Test').destroy
  end
end
