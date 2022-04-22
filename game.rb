require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
class Game
  attr_reader :title, :players

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
