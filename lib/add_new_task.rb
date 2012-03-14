class AddNewTask
  @queue = :default

  def self.perform(list_id)
    if list = List.find_by_id(list_id)
      list.tasks.create(:name => Faker::Company.catch_phrase)
    end
  end
end