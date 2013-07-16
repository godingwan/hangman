require_relative '../lib/game'
require 'pry'

describe Game do
  it 'presents a list of blanks for a given word' do
    test_game = Game.new('hello')

    expect(test_game.blank_array).to eql(['_ ','_ ', '_ ', '_ ', '_ '])
  end

    it 'returns false if the input given is not a letter' do
    test_game = Game.new('hello')

    expect(test_game.input_validation?('MyString')).to eql(false)
  end

  it 'returns true if guessed word is correct' do
    test_game = Game.new('hello')
    correct_bool = test_game.word_guess('hello')

    expect(correct_bool).to eql(true)
  end

  it 'checks if letter guess has already been guessed' do
    test_game = Game.new('hello')
    test_game.letter_guess('a')

    expect(test_game.repeat_letter?('a')).to eql(true)
  end

  it 'returns false is guess is not one character' do
    test_game = Game.new('hello')

    expect(test_game.letter_guess('blah')).to eql(false)
  end

  it 'returns nil if guess is a repeat' do
    test_game = Game.new('hello')
    test_game.letter_guess('a')
    test_game.letter_guess('h')

    expect(test_game.letter_guess('a')).to eql(nil)
    expect(test_game.letter_guess('h')).to eql(nil)
  end

  it 'returns true if guess is correct' do
    test_game = Game.new('hello')

    expect(test_game.letter_guess('h')).to eql(true)
  end

  it 'returns false if submitted letter does not match' do
    test_game = Game.new('hello')
    test_game.letter_guess('b')

    expect(test_game.correct_letter).to eql(false)
  end

  it 'prints out the currently solved word' do
    test_game = Game.new('hello')
    test_game.letter_guess('h')

    expect(test_game.word_so_far_array).to eql(['h ','_ ', '_ ', '_ ', '_ '])
  end

  it 'checks for correctness with repeating letters' do
    test_game = Game.new('hello')
    test_game.letter_guess('l')

    expect(test_game.word_so_far_array).to eql(['_ ','_ ', 'l ', 'l ', '_ '])
  end
end
