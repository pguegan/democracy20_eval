class Ranking

  attr_reader :votes, :candidates

  def initialize(votes, candidates)
    @candidates = candidates
    @candidates.first.votes += votes
  end

  def eliminate(candidate)
    @candidates.first.votes += candidate.votes
    @candidates.delete candidate
  end

end