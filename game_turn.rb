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
    player.found_treasure(treasure)
  end

  def self.print_player_names(players)
    players.each do |p|
      puts p
    end
  end

  def self.print_stats(players)
    players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end

  def self.print_scores(title, players)
    puts "\n#{title} High Scores:"
    players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
  end
end
