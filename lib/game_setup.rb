require 'random_word_generator'

class GameSetup
  attr_reader :players_array, :random_word, :number_of_players

  def initialize(number_of_players)
    @number_of_players = number_of_players
    @players_array = Array.new
    @random_word = RandomWordGenerator.word
  end

  def num_players
    @number_of_players.to_i
  end

  def check_number_of_players(number)
    if number > 5 || number < 1
      return false
    end
  end

  def put_name_in_array(name)
    @players_array << name
  end

  def name_does_not_exist?(name)
    @players_array.each do |x|
      if x == name
        return false
      end
    end
  end
end
