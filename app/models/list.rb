class List < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :tasks , :dependent => :destroy

  def done_tasks
     tasks.where(:done => true).order("updated_at DESC")
  end
  
end
