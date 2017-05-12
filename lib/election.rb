require 'ranking'

class Election

  def initialize
    @rankings = []
  end

  def rank(count:, candidates:)
    return unless count > 0
    if ranking = @rankings.find{ |r| r.candidates == candidates }
      ranking.increment_first_candidate count
    else
      @rankings << Ranking.new(count, candidates)
    end
  end

  def winner
    return nil if candidates.empty?
    until candidates.one? do
      _loser = loser # Pour éviter de rappeler et recalculer loser à chaque itération
      @rankings.each do |ranking|
        ranking.eliminate _loser
      end
    end
    candidates.first
  end

  private

  def loser
    candidates.min_by(&:votes)
  end

  def candidates
    @rankings.map(&:candidates).flatten.uniq
  end

end