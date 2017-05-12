require_relative './candidate'
require_relative './ranking'

class Election

  attr_accessor :rankings

  def initialize
    @rankings = []
  end

  def winner
    loop do
      loser = sums_of_first_candidates.min_by{ |candidate, votes| votes }.first
      rankings.each do |ranking|
        ranking.candidates.delete loser
      end
      return rankings.first.candidates.first if rankings.first.candidates.one?
    end
  end

  private

  def sums_of_first_candidates
    sums = {}
    rankings.each do |ranking|
      sums[ranking.winner] ||= 0
      sums[ranking.winner] += ranking.votes
    end
    sums
  end

end

albert = Candidate.new("Albert")
didier = Candidate.new("Didier")
emilie = Candidate.new("Émilie")
cecile = Candidate.new("Cécile")
basile = Candidate.new("Basile")

Election.new.tap do |election|
  election.rankings << Ranking.new(3_273, [albert, didier, emilie, cecile, basile])
  election.rankings << Ranking.new(2_182, [basile, emilie, didier, cecile, albert])
  election.rankings << Ranking.new(1_818, [cecile, basile, emilie, didier, albert])
  election.rankings << Ranking.new(1_636, [didier, cecile, emilie, basile, albert])
  election.rankings << Ranking.new(727,   [emilie, basile, didier, cecile, albert])
  election.rankings << Ranking.new(364,   [emilie, cecile, didier, basile, albert])
  puts election.winner.name
end