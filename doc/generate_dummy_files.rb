15000.times do |i|
  File.open("dummy-#{i}.txt", "w+") { |f| f.puts("dummy") }
end
