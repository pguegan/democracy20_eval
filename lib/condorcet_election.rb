class CondorcetElection < Election

  def winner
    return nil if candidates.empty?
    candidates.combination(2).each do |c_1, c_2|
      candidates.each { |c| c.votes = 0 }
      @rankings.each do |ranking|
        if ranking.candidates.rindex(c_1) < ranking.candidates.rindex(c_2)
          c_1.votes += ranking.count
        else
          c_2.votes += ranking.count
        end
      end
      if c_1.votes > c_2.votes
        c_1.victories += 1
      else
        c_2.victories += 1
      end
    end
    candidates.max_by(&:victories)
  end

end