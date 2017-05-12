class Ranking

  # Le classement des candidats correspond directement
  # à leur position dans le tableau `candidates`
  attr_reader :candidates

  def initialize(count, candidates)
    @candidates = candidates
    @count = count
    increment_first_candidate
  end

  def eliminate(candidate)
    if @candidates.first == candidate
      @candidates.delete candidate
      # On reporte les voix sur le nouveau premier candidat du classement
      increment_first_candidate
    else
      @candidates.delete candidate
    end
  end

  # Le nombre de fois où on a voté pour ce classement
  # est stocké sur le premier candidat du classement
  def increment_first_candidate(count = @count)
    @candidates.first.votes += count
  end

end