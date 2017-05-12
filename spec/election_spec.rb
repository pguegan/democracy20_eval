require 'election'

RSpec.describe Election do

  let(:election) { Election.new }
  let(:albert) { Candidate.new "Albert" }
  let(:basile) { Candidate.new "Basile" }
  let(:cecile) { Candidate.new "Cécile" }
  let(:didier) { Candidate.new "Didier" }
  let(:emilie) { Candidate.new "Émilie" }

  describe "#rank" do

    let(:candidates) { [albert, basile, cecile] }

    context "new ranking" do

      it "initializes a new rank" do
        expect(Ranking).to receive(:new).with(100, candidates)
        election.rank(count: 100, candidates: candidates)
      end

      it "ignores zero count" do
        expect(Ranking).to_not receive(:new)
        election.rank(count: 0, candidates: candidates)
      end

      it "ignores negative count" do
        expect(Ranking).to_not receive(:new)
        election.rank(count: -10, candidates: candidates)
      end

    end

    context "existing ranking" do

      it "aggregates with the existing ranking" do
        ranking = election.rank(count: 100, candidates: candidates)
        expect(Ranking).to_not receive(:new)
        expect do
          election.rank(count: 50, candidates: candidates)
        end.to change(albert, :votes).from(100).to(150)
      end

    end

  end

  describe "#winner" do

    context "no candidates" do

      it "has no winner" do
        expect(election.winner).to be_nil
      end

    end

    context "one candidate" do

      it "is the only candidate" do
        election.rank(count: 1, candidates: [albert])
        expect(election.winner).to eq(albert)
      end

    end

    context "several candidates" do

      it "is the candidate elected by alternative vote" do
        election.rank(count: 3_273, candidates: [albert, didier, emilie, cecile, basile])
        election.rank(count: 2_182, candidates: [basile, emilie, didier, cecile, albert])
        election.rank(count: 1_818, candidates: [cecile, basile, emilie, didier, albert])
        election.rank(count: 1_636, candidates: [didier, cecile, emilie, basile, albert])
        election.rank(count: 727,   candidates: [emilie, basile, didier, cecile, albert])
        election.rank(count: 364,   candidates: [emilie, cecile, didier, basile, albert])
        expect(election.winner).to eq(cecile)
      end

    end

  end

end