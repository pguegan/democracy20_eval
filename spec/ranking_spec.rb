require 'ranking'

RSpec.describe Ranking do

  let(:albert) { Candidate.new "Albert" }
  let(:basile) { Candidate.new "Basile" }
  let(:cecile) { Candidate.new "Cécile" }
  let(:candidates) { [albert, basile, cecile] }
  let(:ranking) { Ranking.new 3_273, candidates }

  describe "#initialize" do

    it "preserves candidates' positions" do
      expect(ranking.candidates).to eq(candidates)
    end

    it "sets the votes count to the first candidate" do
      expect do
        ranking
      end.to change(albert, :votes).from(0).to(3_273)
    end

    it "doesn't change other candidates votes count" do
      expect do
        ranking
      end.to_not change(basile, :votes)
    end

  end

  describe "#eliminate" do

    it "deletes candidate from ranking" do
      expect do
        ranking.eliminate basile, cecile
      end.to change(ranking, :candidates).from([albert, basile, cecile]).to([albert])
    end

    it "ignores unknown candidate" do
      expect do
        ranking.eliminate Candidate.new("Didier")
      end.to_not change(ranking, :candidates)
    end

    it "transfers votes from eliminated candidate to the remaining first candidate" do
      expect do
        ranking.eliminate albert
      end.to change(basile, :votes).from(0).to(3_273)
    end

  end

end