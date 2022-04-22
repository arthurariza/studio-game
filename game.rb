class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "The are #{@players.size} in #{@title}:"

    @players.each do |p|
      puts p
    end

    @players.each do |p|
      p.w00t
      p.blam
      p.w00t
      puts "#{p}\n\n"
    end
  end
end
