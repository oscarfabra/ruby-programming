starting_sentence = "Hi from matching land"
sentence_array = starting_sentence.split("").map(&:downcase)
sentence_without_spaces = sentence_array - [" "]
final_sentence = starting_sentence.gsub(/[a-zA-Z]/, "_").split("")

# p sentence_array.count("")
# p sentence_without_spaces.count

while sentence_array.count("") < sentence_without_spaces.count
  puts "Guess a letter: "
  guess = gets.downcase.chomp

  if sentence_array.include?(guess)
    letter_index = sentence_array.find_index(guess)
    sentence_array[letter_index] = ""
    final_sentence[letter_index] = guess
    puts "Correct! The sentence is now: #{final_sentence.join}"
  else
    puts "Sorry, that letter isn't in the sentence. Please try again."
  end
end