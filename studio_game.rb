require_relative 'player'
require_relative 'game'

player1 = Player.new('larry', 60)
player2 = Player.new('curly', 125)
player3 = Player.new('moe')

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play
