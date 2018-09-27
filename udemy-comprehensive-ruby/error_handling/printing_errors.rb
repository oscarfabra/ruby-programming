# Function to log an error
def error_logger(e)
  File.open("error_handling/error_log.txt", "a") do |file|
    file.puts e
  end
end

# Error rescuing example
begin
  puts 8/0
rescue StandardError => e
  error_logger("Error: #{e} at #{Time.now}")
end