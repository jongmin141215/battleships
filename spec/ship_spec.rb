require 'ship'
describe Ship do
  it { is_expected.to respond_to(:size) }

  it "has default size 2 when created" do
    expect(subject.size).to eq(2)
  end

  it "has size 7 when created with parameter 7" do
    expect(Ship.new(7).size).to eq(7)
  end

  # it "has no assigned board when created" do
  #   expect(subject.board).to eq(nil)
  # end
  #
  # it "can be assigned a board" do
  #   subject.set_board(:board)
  #   expect(subject.board).to eq(:board)
  # end
end
