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

player1 = Player.new('larry', 60)
player2 = Player.new('curly', 125)
player3 = Player.new('moe')

players = [player1, player2, player3]

puts "The are #{players.size} in the game:"
players.each do |p|
  puts p
end

players.each do |p|
  puts p.health
end

players.each do |p|
  p.w00t
  p.blam
  p.w00t
  puts "#{p}\n\n"
end
