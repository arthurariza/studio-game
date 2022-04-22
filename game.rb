require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
class Game
  attr_reader :title

  include GameTurn

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "The are #{@players.size} in #{@title}:"

    GameTurn.print_player_names(@players)

    @players.each do |p|
      GameTurn.take_turn(p)
      puts "#{p}\n\n"
    end
  end
end
