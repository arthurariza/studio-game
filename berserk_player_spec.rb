require_relative 'berserk_player'

describe BerserkPlayer do
  let(:player) { BerserkPlayer.new('berserker', 50) }

  it 'does not go berserk when w00ted up to 5 times' do
    1.upto(5) { player.w00t }

    expect(player).not_to be_berserk
  end

  it 'goes berserk when w00ted more than 5 times' do
    1.upto(6) { player.w00t }

    expect(player).to be_berserk
  end

  it "gets w00ted instead of blammed when it's gone berserk" do
    1.upto(6) { player.w00t }
    1.upto(2) { player.blam }

    expect(player.health).to eq 50 + (8 * 15)
  end
end
