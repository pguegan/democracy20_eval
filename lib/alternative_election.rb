require 'election'

class AlternativeElection < Election

  def winner
    return nil if candidates.empty?
    until candidates.one? do
      @rankings.each do |ranking|
        ranking.eliminate loser
      end
    end
    candidates.first
  end

  private

  def loser
    candidates.min_by(&:votes)
  end

end