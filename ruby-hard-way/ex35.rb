# Branches and Functions

def gold_room
  puts "This room is full of gold. How much do you take?"
  print "> "
  choice = $stdin.gets.chomp

  # Checks whether given input is an integer
  if !(Integer(choice) rescue false)
    dead "Input must be an integer!"
  end

  if choice.to_i < 50
    puts "Nice, you're not greedy, you win!"
    exit 0
  else
    dead "You're too greedy!"
  end
end

def bear_room
  puts """
  There is a bear here.
  The bear has a bunch of honey.
  The fat bear is in front of another door.
  What are you going to do?
    1. Run away.
    2. Taunt bear.
    3. Open door.
  """
  bear_moved = false

  while true
    print "> "
    choice = $stdin.gets.chomp

    if !(Integer(choice) rescue false)
      dead "Input must be an integer!"
    end

    number = choice.to_i
    if number == 1
      puts "Nowhere to run!"
    elsif number == 2 && !bear_moved
      puts "The bear has moved from the door. You can go through."
      bear_moved = true
    elsif number == 2 && bear_moved
      dead "You have to move quickly!"
    elsif number == 3 && bear_moved        
      gold_room
    elsif number == 3 && !bear_moved
      puts "The bear is blocking the way!"
    else
      puts "What does that mean?"
    end
  end
end

def paradise_room
  puts """
  This is a paradise!
  There's lots of fruits and animals here.
  Sun is shining but you have to start from scratch here.
  What are you going to do?
    1. Eat fruits.
    2. Build a cottage.
    3. Take a long walk.
  """

  while true
    print "> "
    choice = $stdin.gets.chomp

    if !(Integer(choice) rescue false)
      dead "Input must be an integer!"
    end

    number = choice.to_i
    if number == 1
      puts "Mmmh... you got full of food!"
    elsif number == 2
      puts "Lot of work to do... taking some time!"
    elsif number == 3
      puts "Found a secret!"
      gold_room
    else        
      paradise_room
    end
  end
end

def dead why
  puts why + " Bye!"
  exit 0
end

def start
  puts """
  You are in a dark room.
  There is a door to your left (l) and right (r).
  Which one do you take?
  """

  while true
    print "> "
    choice = $stdin.gets.chomp

    if !choice.is_a?(String)
      dead "Input must be r or l!"
    end
    
    if choice == 'l'
      bear_room
    elsif choice == 'r'
      paradise_room
    else
      puts "That's not an option."    
    end
  end
end

start