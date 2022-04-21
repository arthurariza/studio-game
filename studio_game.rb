class Player
  attr_reader :name, :health

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"
  end

  def name=(name)
    @name = name.capitalize
  end

  def score
    @health + @name.size
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

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

player1 = Player.new('larry', 60)
player2 = Player.new('curly', 125)
player3 = Player.new('moe')

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play
