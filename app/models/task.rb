class Task < ActiveRecord::Base
  belongs_to :user
    
    belongs_to :list, :class_name => "List", :foreign_key => "list_id"
    
    validates :name, :presence => true

  def self.for_user(user)
    where(:user_id => user.id)
  end
end
