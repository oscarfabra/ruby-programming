10.times do
  sleep 1
  puts "Record saved..."
  # Writes a new line with current time on server_logs.txt. If the file doesn't exists, it creates it.
  File.open("files_lessons/server_logs.txt", "a") { |f| f.puts "Server started at: #{Time.new}" }
end