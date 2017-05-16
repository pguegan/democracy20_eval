require 'election'

class TwoRoundElection < Election

  def winner
    if winner = absolute_winner
      winner
    else
      eliminate_first_round_losers
      second_round_winner
    end
  end

  private

  def absolute_winner
    candidates.find do |candidate|
      candidate.votes > total_votes / 2.0
    end
  end

  def total_votes
    candidates.inject(0) { |sum, candidate| sum + candidate.votes }
  end

  def eliminate_first_round_losers
    first_round_winners = candidates.max_by 2, &:votes
    first_round_losers = candidates - first_round_winners
    rankings.each do |ranking|
      ranking.eliminate *first_round_losers
    end
  end

  def second_round_winner
    candidates.max_by &:votes
  end

end