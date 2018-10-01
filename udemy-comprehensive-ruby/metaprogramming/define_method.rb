class Author
  # Basic example
  # define_method("some_method") do
  #   puts "Some details"
  # end

  # def fiction_details(arg)
  #   puts "Fiction"
  #   puts arg
  #   puts "asdfasdfas"
  # end

  # def coding_details(arg)
  #   puts "Coding"
  #   puts arg
  #   puts "asdfasdfas"
  # end

  # def history_details(arg)
  #   puts "History"
  #   puts arg
  #   puts "asdfasdfas"
  # end

  # Creates an array of strings
  genres = %w(fiction coding history)

  # Creates a new method for each genre, when the object is created
  genres.each do |genre|
    define_method("#{genre}_details") do |arg|
      puts "Genre: #{genre}"
      puts arg
      puts genre.object_id
    end
  end

end

author = Author.new
# author.some_method  # Basic example
author.coding_details("Cal Newport")
author.fiction_details("Ayn Rand")

# Identifies the method. Not as flexible as method_missing though.
# You need to know the method names in advance.
p author.respond_to?(:coding_details)