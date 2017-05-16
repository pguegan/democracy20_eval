require 'ranking'

class Election

  def initialize
    @rankings = []
  end

  def rank(count:, candidates:)
    return unless count > 0
    if ranking = rankings.find{ |r| r.candidates == candidates }
      ranking.increment_first_candidate count
    else
      rankings << Ranking.new(count, candidates)
    end
  end

  private

  attr_reader :rankings

  def candidates
    rankings.map(&:candidates).flatten.uniq
  end

end