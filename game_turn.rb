require_relative 'treasure_trove'
module GameTurn
  def self.take_turn(player)
    case Die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped"
    else
      player.w00t
    end
    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end

  def self.print_player_names(players)
    players.each do |p|
      puts p
    end
  end

  def self.print_stats(title, players)
    strong_players, wimpy_players = players.partition(&:strong?)
    puts "\n#{title} Statistics:"

    puts "\n#{strong_players.size} strong player(s):"
    strong_players.each { |p| puts "#{p.name} (#{p.score})" }

    puts "\n#{wimpy_players.size} wimpy player(s):"
    wimpy_players.each { |p| puts "#{p.name} (#{p.score})" }
  end

  def self.print_scores(title, players)
    puts "\n#{title} High Scores:"
    players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
  end
end
