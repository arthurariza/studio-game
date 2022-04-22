require_relative 'player'

# rubocop:disable Metrics/BlockLength
RSpec.describe Player do
  before do
    # Disable puts on test runs
    $stdout = StringIO.new
  end

  let!(:player) { Player.new('aaron', 80) }
  let(:hammer) { Treasure.new(:hammer, 50) }
  let(:crowbar) { Treasure.new(:crowbar, 400) }

  it 'has a capitialized name' do
    expect(player.name).to eq 'Aaron'
  end

  it 'has an initial health' do
    expect(player.health).to eq 80
  end

  it 'has an empty found_treasures hash' do
    expect(player.found_treasures).to be_empty
  end

  it 'has a string representation' do
    player.found_treasure(Treasure.new(:hammer, 50))
    player.found_treasure(Treasure.new(:hammer, 50))

    expect(player.to_s).to eq "I'm Aaron with a health = 80, points = 100, and a score of 180"
  end

  it 'increases health by 15 when w00ted' do
    expect { player.w00t }.to change { player.health }.from(80).to(95)
  end

  it 'decreases health by 10 when blammed' do
    expect { player.blam }.to change { player.health }.from(80).to(70)
  end

  context 'when creating a player with no health' do
    let!(:no_health) { Player.new('Steve') }
    it 'has a default value of 100' do
      expect(no_health.health).to eq(100)
    end
  end

  context 'with a health greater than 100' do
    it 'is strong' do
      strong_player = Player.new('Strong', 150)
      expect(strong_player).to be_strong
    end
  end

  context 'with a health lower than 100' do
    it 'is wimpy' do
      wimpy_player = Player.new('Wimpy', 99)
      expect(wimpy_player).not_to be_strong
    end
  end

  context 'when founding a treasure' do
    it 'adds the treasure to the found_treasures hash' do
      player.found_treasure(hammer)

      expect(player.found_treasures).to include({ hammer: 50 })
    end

    it 'prints the player name and points of the treasure and then all the players treasures' do
      expect { player.found_treasure(crowbar) }.to output(/Aaron found a crowbar worth 400 points/).to_stdout
    end

    xit "prints all the player's treasure" do
      expect { player.found_treasure(crowbar) }.to output(/Aaron's treasures: {:crowbar => 400}/).to_stdout
    end

    it 'computes a score as the sum of its health and points' do
      player.found_treasure(hammer)
      player.found_treasure(crowbar)

      expect(player.score).to eq 530
    end

    it 'computes points as the sum of all treasure points' do
      expect(player.points).to eq 0

      player.found_treasure(hammer)
      expect(player.points).to eq 50

      player.found_treasure(crowbar)
      expect(player.points).to eq 450

      player.found_treasure(hammer)
      expect(player.points).to eq 500
    end
  end

  # rubocop:enable Metrics/BlockLength
end
