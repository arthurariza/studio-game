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

  def load_players(filename)
    File.readlines(filename).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save_high_scores(to_file = 'high_scores.txt')
    File.open(to_file, 'w') do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |player|
        formatted_name = player.name.ljust(20, '.')
        file.puts "#{formatted_name} #{player.score}"
      end
    end
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
    GameTurn.print_stats(@players)
    GameTurn.print_scores(@title, @players)
  end
end
