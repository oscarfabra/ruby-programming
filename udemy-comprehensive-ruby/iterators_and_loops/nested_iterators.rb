# Hash
teams = {
  "Houston Astros" => {
    "first base" => "Chris Carter",
    "second base" => "Jose Altuve",
    "shortstop" => "Carlos Correa"
  },
  "Texas Rangers" => {
    "first base" => "Prince Fielder",
    "second base" => "R. Odor",
    "shortstop" => "Elvis Andrus"
  }
}

teams.each do |team, players|
  puts team
  players.each do |position, name|
    p "#{name} starts at #{position}"
  end
  puts
end