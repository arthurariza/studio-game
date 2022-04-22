require_relative 'player'
require_relative 'die'
class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_player_names
    @players.each do |p|
      puts p
    end
  end

  def play
    puts "The are #{@players.size} in #{@title}:"

    print_player_names

    @players.each do |p|
      case Die.roll
      when 1..2
        p.blam
      when 3..4
        puts "#{p.name} was skipped"
      else
        p.w00t
      end
      puts "#{p}\n\n"
    end
  end
end
