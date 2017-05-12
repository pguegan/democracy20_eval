class Ranking

  attr_reader :votes, :candidates

  def initialize(votes, candidates)
    @votes = votes
    @candidates = candidates
  end

  def winner
    @candidates.first
  end

end