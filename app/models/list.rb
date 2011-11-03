class List
  include Mongoid::Document
  field :name, :type => String
  field :created_at, :type => DateTime
  field :updated_at, :type => DateTime
  
  validates :name, :presence => true
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  has_many :tasks , :dependent => :destroy

  def done_tasks
     tasks.where(:done => true).order("updated_at DESC")
  end
  
end
