require_relative 'player'

# rubocop:disable Metrics/BlockLength
RSpec.describe Player do
  before do
    # Disable puts on test runs
    $stdout = StringIO.new
  end

  let!(:player) { Player.new('aaron', 80) }

  it 'has a capitialized name' do
    expect(player.name).to eq 'Aaron'
  end

  it 'has an initial health' do
    expect(player.health).to eq 80
  end

  it 'has a string representation' do
    expect(player.to_s).to eq "I'm Aaron with a health of 80 and a score of 85"
  end

  it 'computes a score as the sum of its health and length of name' do
    expect(player.score).to eq 85
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
      wimpy_player = Player.new('Wimpy', 100)
      expect(wimpy_player).not_to be_strong
    end
  end
end
