module App
  # start to work by itself, creating and deleting items randomly
  def self.comes_to_life
    5.times do
      List.create(name: random_word)
    end

    loop do
      if create_or_delete? == :create
        Task.create!(name: random_word, list: List.all.sample)
      else
        Task.all.sample.destroy!
      end
      sleep(2)
    end
  end

  # it favors creation intentionally
  def self.create_or_delete?
    roll_the_dice > 2 ? :create : :delete
  end

  def self.roll_the_dice
    rand(1..6)
  end

  def self.random_word
    word = ''
    roll_the_dice.times do
      word += ('a'..'z').to_a.sample
    end
    word
  end

  def self.create_and_delete_indefinitely_by_id
    last_id = Task.last.id
    loop do
      Task.create!(name: random_word, list: List.all.sample)
      Task.destroy(last_id + 1)
      last_id += 1
      sleep(2)
    end
  end
end
