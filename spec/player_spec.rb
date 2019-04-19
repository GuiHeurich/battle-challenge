require './player.rb'

describe Player do
  subject(:callum) { Player.new('Callum')}
  subject(:gui) { Player.new('Gui')}

  describe '#name' do
    it "returns the name" do
      expect(callum.name).to eq 'Callum'
    end
  end

  describe '#hit_points' do
    it "returns the hit poinst" do
      expect(callum.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it "reduces the player hit points" do
      expect { callum.receive_damage }.to change { callum.hit_points }.by -10
    end
  end

end
