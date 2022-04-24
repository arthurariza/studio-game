require_relative 'clumsy_player'

describe ClumsyPlayer do
  let(:clumsy_player) { ClumsyPlayer.new('klutz', 0) }

  it 'only gets half the point value for each treasure' do
    expect(clumsy_player.points).to eq 0

    hammer = Treasure.new(:hammer, 50)
    clumsy_player.found_treasure(hammer)
    clumsy_player.found_treasure(hammer)
    clumsy_player.found_treasure(hammer)

    expect(clumsy_player.points).to eq 75

    crowbar = Treasure.new(:crowbar, 400)
    clumsy_player.found_treasure(crowbar)

    expect(clumsy_player.points).to eq 275

    yielded = []
    clumsy_player.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]
  end
end
