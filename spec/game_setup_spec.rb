require_relative '../lib/game_setup'

describe GameSetup do
  it 'checks for how many players' do
    test_game = GameSetup.new(3)

    expect(test_game.number_of_players).to eql(3)
  end

  it 'creates a new instance of game when the number of players are more than 5' do
    test_game = GameSetup.new(6)
    num_players = test_game.num_players

    expect(test_game.check_number_of_players(num_players)).to eql(false)
  end

  it 'adds names to an array' do
    test_game = GameSetup.new(3)
    test_game.put_name_in_array("John")

    expect(test_game.players_array).to eql(["John"])
  end

  it 'does not add name if name already exists' do
    test_game = GameSetup.new(2)
    test_game.put_name_in_array("John")

    expect(test_game.name_does_not_exist?("John")).to eql(false)
  end
end
