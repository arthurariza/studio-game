require_relative 'treasure_trove'
require_relative 'playable'

class Player
  attr_reader :name, :health, :found_treasures

  include Playable

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and a score of #{score}"
  end

  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end

  def <=>(other)
    other.score <=> score
  end

  def name=(name)
    @name = name.capitalize
  end

  def score
    @health + points
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"

    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.sum
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end
end
