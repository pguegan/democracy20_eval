require 'ranking'

RSpec.describe Ranking do

  let(:albert) { Candidate.new "Albert" }
  let(:basile) { Candidate.new "Basile" }
  let(:cecile) { Candidate.new "Cécile" }
  let

  describe "#name" do

    it "is the candidate's name" do
      expect(albert.name).to eq("Albert")
    end

  end

  describe "#votes" do

    it "is zero by default" do
      expect(albert.votes).to eq(0)
    end

    it "returns candidate's current votes count" do
      expect do
        albert.add_votes 75
      end.to change(albert, :votes).from(0).to(75)
    end

  end

  describe "#add_votes" do

    it "returns candidate's current votes count" do
      expect(albert.add_votes 500).to eq(500)
    end

    it "accumulates candidate's current votes count" do
      albert.add_votes 100
      expect do
        albert.add_votes 50
      end.to change(albert, :votes).from(100).to(150)
    end

    it "ignores negative counts" do
      expect do
        albert.add_votes -10
      end.to_not change(albert, :votes)
    end

  end

  describe "#score" do

    it "is zero by default" do
      expect(albert.score).to eq(0)
    end

    context "when there is only one candidates" do

      it "is 100 if candidate has at least one vote" do
        albert.add_votes 1
        expect(albert.score).to eq(100)
      end

    end

    context "when there are several candidates" do

      it "is the percentage of votes among all other candidates" do
        albert.add_votes 30
        basile.add_votes 100
        expect(albert.score).to be_within(0.001).of(23.0769230769)
        expect(basile.score).to be_within(0.001).of(76.9230769231)
      end

    end

  end

  describe ".winners" do

    context "an absolute winner exists" do

      it "is the absolute winner" do
        albert.add_votes 100
        basile.add_votes 1000
        cecile.add_votes 100
        expect(Candidate.winners).to eq([basile])
      end

    end

    context "a second round will be required" do

      it "is the couple of candidates having the higher scores, ordered by descending scores" do
        albert.add_votes 200
        basile.add_votes 300
        cecile.add_votes 400
        expect(Candidate.winners).to include(basile)
        expect(Candidate.winners).to include(cecile)
      end

      it "is orders by descending scores" do
        albert.add_votes 200
        basile.add_votes 300
        cecile.add_votes 400
        expect(Candidate.winners).to eq([cecile, basile])
      end

    end

  end

end