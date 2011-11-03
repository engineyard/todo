class Task
  include Mongoid::Document
  field :name, type: String
  field :done, type: Boolean
  field :list_id, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime


  belongs_to :list, :class_name => "List", :foreign_key => "list_id"

  validates :name, :presence => true

end
