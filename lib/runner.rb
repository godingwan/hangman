require_relative 'game_setup'
require_relative 'players'
require_relative 'game'

require 'pry'

intro_text = "How many players? Min: 1, Max: 5"

puts intro_text

player_count = gets.chomp

setup = GameSetup.new(player_count)
num_players = setup.num_players
players_bool = setup.check_number_of_players(num_players)
while players_bool == false
  puts "There can only be 1 to 5 players."
  puts intro_text
  player_count = gets.chomp
  setup = GameSetup.new(player_count)
  num_players = setup.num_players
  players_bool = setup.check_number_of_players(num_players)
end

setup.num_players.times do |i|
  result = false
  while result == false
    puts "What is player #{i+1}'s name?"
    name = gets.chomp
    result = setup.name_does_not_exist?(name)
    setup.put_name_in_array(name)
    if result == false
      puts "Name has already been taken"
    end
  end
end

puts
puts "Okay, let's play!"

players_class = Players.new(setup.players_array)

game = Game.new(setup.random_word)

while game.blank_array != game.answer_array
  game.blank_array.each do |char|
    print char
  end
  puts
  shuffled_player = players_class.randomize
  print "#{shuffled_player}, guess a letter, or enter ! to solve the puzzle: "
  ans = gets.chomp.downcase
  result = game.letter_guess(ans)

  if result == false
    puts
    puts "Please only guess a letter!"
    puts "As punishment, we will skip your turn."
  elsif ans == "!"
    puts
    puts "What is your guess, #{shuffled_player}?"
    if game.word_guess(gets.chomp.downcase)
      break
    else
      puts "Nope, sorry! Next person!"
      next
    end
  elsif result == nil
    puts
    puts 'That letter has already been guessed.'
    puts "As punishment, your turn will be skipped."
  elsif game.correct_letter == true
    puts
    puts "We found #{ans}!"
  elsif game.correct_letter == false
    puts
    puts "Sorry, we did not find #{ans}."
  end
  puts
  puts "Letters guessed so far #{game.guess_array.join(', ')}."
  puts
end
puts "#{shuffled_player} wins! Congratulations!"
