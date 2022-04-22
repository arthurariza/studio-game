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

  def strong?
    @health > 100
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
