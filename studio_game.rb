class Player
  attr_accessor :name
  attr_reader :health

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

player1 = Player.new('larry', 60)
player2 = Player.new('curly', 125)
player3 = Player.new('moe')

player1.name = 'lawrence'

puts player1
puts player2
puts player3
