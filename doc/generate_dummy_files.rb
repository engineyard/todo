15000.times do |i|
  File.open("dummy_new-#{i}.txt", "w+") { |f| f.puts("dummy") }
end
