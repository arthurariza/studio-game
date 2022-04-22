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
  end

  def self.print_player_names(players)
    players.each do |p|
      puts p
    end
  end
end
