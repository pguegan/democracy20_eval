require 'candidate'

module VictoriousCandidate

  refine Candidate do

    attr_writer :victories

    def victories
      # Malheureusement, on ne peut pas surcharger
      # le constructeur dans un refinement
      @victories ||= 0
    end

    def fight_with(other)
      if votes > other.votes
        self.victories += 1
      else
        other.victories += 1
      end
    end

  end

end

class CondorcetElection < Election

  using VictoriousCandidate

  def winner
    candidates.combination(2).each do |c_1, c_2|
      compare c_1, c_2
    end
    candidates.max_by(&:victories)
  end

  private

  def compare(c_1, c_2)
    c_1.votes, c_2.votes = 0, 0
    @rankings.each do |ranking|
      ranking.compare c_1, c_2
    end
    c_1.fight_with c_2
  end

end