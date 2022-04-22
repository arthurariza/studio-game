require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
class Game
  attr_reader :title, :players

  include TreasureTrove
  include GameTurn

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "The are #{@players.size} in #{@title}:"

    GameTurn.print_player_names(@players)

    treasures = TreasureTrove::TREASURES

    puts "There are #{treasures.size} treasures to be found:"

    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end

    1.upto(rounds) do |round|
      @players.each do |player|
        puts "\nRound #{round}:"
        GameTurn.take_turn(player)
        puts player
      end
    end
    GameTurn.print_stats(@title, @players)
    GameTurn.print_scores(@title, @players)
  end
end
