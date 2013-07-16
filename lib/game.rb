require 'pry'

class Game
  attr_accessor :blank_array, :answer_array
  attr_reader :correct_letter, :guess_array

  def initialize(word)
    @word = word
    @blank_array = Array.new
    @answer_array = Array.new
    @guess_array = Array.new
    @correct_letter = false
    @repeat_bool = false
    self.blankify
    self.answer
  end

  def blankify
    @word.each_char do |char|
      @blank_array << "\_ "
    end
    return @blank_array
  end

  def answer
    @word.each_char do |char|
      @answer_array << "#{char} "
    end
    return @answer_array
  end

  def letter_guess(letter)
    if input_validation?(letter)
      @repeat_bool = false
      repeat_letter?(letter)
      if @repeat_bool
        return nil
      else
        @correct_letter = false
        guess = letter.to_s + ' '
        # return_value = false
        counter = 0
        @answer_array.each do |char|
          if char == guess
            array_position = counter
            @blank_array[array_position] = guess
            @correct_letter = true
          end
          counter += 1
        end
        unless letter == "!"
          @guess_array << letter
        end
        return true
      end
    else
      return false
    end
  end

  def repeat_letter?(letter)
    @guess_array.each do |character|
      if character == letter
        return @repeat_bool = true
      end
    end
  end

  def word_so_far_array
    return @blank_array
  end

  def word_guess(player_guess_string)
    player_guess_array = Array.new
    player_guess_string.each_char do |char|
      player_guess_array << "#{char} "
    end
    if player_guess_array == @answer_array
      return true
    else
      return false
    end
  end

  def input_validation?(input)
    if input.length == 1
      return true
    else
      return false
    end
  end
end
