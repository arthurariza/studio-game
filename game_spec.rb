require_relative 'game'

# rubocop:disable Metrics/BlockLength
RSpec.describe Game do
  before do
    # Disable puts on test runs
    $stdout = StringIO.new
  end

  let!(:game) { Game.new('Knuckleheads') }
  let!(:player) { Player.new('moe', 100) }

  before do
    game.add_player(player)
  end

  it 'w00ts the player if a high number is rolled' do
    allow(Die).to receive(:roll).and_return(6)

    expect { game.play(2) }.to change { player.health }.from(100).to(130)
  end

  it 'blams the player if a low number is rolled' do
    allow(Die).to receive(:roll).and_return(1)

    expect { game.play(2) }.to change { player.health }.from(100).to(80)
  end

  it 'skips the player if a medium number is rolled' do
    allow(Die).to receive(:roll).and_return(3)

    expect { game.play(2) }.not_to change { player.health }
  end

  it 'prints the round number' do
    expect { game.play(3) }.to output(/Round 1/).to_stdout
    expect { game.play(3) }.to output(/Round 2/).to_stdout
    expect { game.play(3) }.to output(/Round 3/).to_stdout
    expect { game.play(3) }.not_to output(/Round 4/).to_stdout
    expect { game.play(3) }.not_to output(/Round 5/).to_stdout
  end

  context 'when the game ends' do
    let!(:player2) { Player.new('curly', 80) }
    let!(:player3) { Player.new('larry', 95) }

    before do
      game.add_player(player2)
      game.add_player(player3)
    end

    it 'prints the scores' do
      allow(Die).to receive(:roll).and_return(3)
      allow(TreasureTrove).to receive(:random).and_return(Treasure.new(:hammer, 50))

      game.play(3)

      expect do
        GameTurn.print_scores(game.title, game.players)
      end.to output("\nKnuckleheads High Scores:\nMoe................. 250\nLarry............... 245\nCurly............... 230\n").to_stdout
    end
  end

  it "assigns a treasure for points during a player's turn" do
    game.add_player(player)

    game.play(1)

    expect(player.points).not_to be_zero
  end
end
