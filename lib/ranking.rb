class Ranking

  # Le classement des candidats correspond directement
  # à leur position dans le tableau `candidates`
  attr_reader :candidates, :count

  def initialize(count, candidates)
    @candidates = candidates
    @count = count
    increment_first_candidate
  end

  def eliminate(*losers)
    losers.each do |loser|
      if loser == @candidates.first
        @candidates.delete loser
        # On reporte les voix sur le nouveau premier candidat du classement
        increment_first_candidate
      else
        @candidates.delete loser
      end
    end
  end

  def compare(c_1, c_2)
    if position_of(c_1) < position_of(c_2)
      increment_candidate c_1
    else
      increment_candidate c_2
    end
  end

  # Le nombre de fois où on a voté pour ce classement
  # est stocké sur le premier candidat du classement
  def increment_first_candidate(count = @count)
    increment_candidate @candidates.first, count: count
  end

  def position_of(candidate)
    @candidates.rindex candidate
  end

  private

  def increment_candidate(candidate, count: @count)
    candidate.votes += count
  end

end