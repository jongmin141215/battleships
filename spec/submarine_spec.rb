require 'submarine'

describe Submarine do

  it "knows all positions when facing north" do
    sub = Submarine.new("B2", :N)
    expect(sub.all_positions).to eq(['B2', 'B1'])
  end

  it "knows all positions when facing south" do
    sub = Submarine.new("B2", :S)
    expect(sub.all_positions).to eq(['B2', 'B3'])
  end

  it "knows all positions when facing west" do
    sub = Submarine.new("B2", :W)
    expect(sub.all_positions).to eq(['B2', 'A2'])
  end

  it "knows all positions when facing west" do
    sub = Submarine.new("B2", :E)
    expect(sub.all_positions).to eq(['B2', 'C2'])
  end

end
