require "open3"
require "game"

describe "The method play_round returns valid attack's result" do
  it "Returns a Hash with attack result" do
    expect(play_round(12, 20)).to be_a Hash
  end

  it "Check attack result hask keys" do
    result = play_round(14, 20)
    expect(result).to include(:hp)
    expect(result).to include(:message)
  end

  it "The result of HP calculated for the range 0..15 and should be 0 HP" do
    result = play_round(14, 20)
    expect(result[:hp]).to eq (0)
    expect(result[:message]).to eq "Errou - 0 HP"
  end

  it "The result of HP calculated for the range 16..70 and should be 6 HP" do
    result = play_round(42, 20)
    expect(result[:hp]).to eq (6)
    expect(result[:message]).to eq "Normal - 6 HP"
  end

  it "Test two times in same range with differents values and the result from first test must be the same as the second test" do
    result1 = play_round(42, 20)
    result2 = play_round(68, 20)
    expect(result1[:hp]).to eq result2[:hp]
  end

  it "The result of HP calculated for the range 71..96 should be 24 HP" do
    result = play_round(71, 20)
    expect(result[:hp]).to eq (24)
    expect(result[:message]).to eq "Sorte!!! - 24 HP"
  end

  it "The result of HP calculated for the range 97..100 and should be 40 HP" do
    result = play_round(99, 20)
    expect(result[:hp]).to eq (40)
    expect(result[:message]).to eq "Crítico! - 40 HP"
  end
end
