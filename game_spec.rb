require_relative 'game'

RSpec.describe Game do
  let!(:game) { Game.new('Knuckleheads') }
  let!(:player) { Player.new('moe', 100) }

  before do
    game.add_player(player)
  end

  it 'w00ts the player if a high number is rolled' do
    allow(Die).to receive(:roll).and_return(6)

    expect { game.play }.to change { player.health }.from(100).to(115)
  end

  it 'blams the player if a low number is rolled' do
    allow(Die).to receive(:roll).and_return(1)

    expect { game.play }.to change { player.health }.from(100).to(90)
  end

  it 'skips the player if a medium number is rolled' do
    allow(Die).to receive(:roll).and_return(3)

    expect { game.play }.not_to change { player.health }
  end
end
