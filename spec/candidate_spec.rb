require 'candidate'

RSpec.describe Candidate do

  let(:candidate) { Candidate.new "Albert" }

  describe "#name" do

    it "is the candidate's name" do
      expect(candidate.name).to eq("Albert")
    end

  end

  describe "#votes" do

    it "is zero by default" do
      expect(candidate.votes).to eq(0)
    end

    it "returns candidate's current votes count" do
      expect do
        candidate.votes = 75
      end.to change(candidate, :votes).from(0).to(75)
    end

  end

end