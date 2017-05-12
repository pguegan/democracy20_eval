require 'candidate'

RSpec.describe Candidate do

  let(:albert) { Candidate.new "Albert" }
  #let(:basile) { Candidate.new "Basile" }
  #let(:cecile) { Candidate.new "Cécile" }

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
        albert.votes = 75
      end.to change(albert, :votes).from(0).to(75)
    end

  end

end