class Candidate

  @@total_votes = 0
  @@candidates = []

  # name : nom du candidat.
  # votes : nombre de votes du candidat.
  attr_reader :name, :votes

  def initialize(name)
    @name = name
    @votes = 0
    @@candidates << self
  end

  # Augmente le nombre de votes du candidat par la quantité spécifiée.
  def add_votes(count)
    if count > 0
      @@total_votes += count
      @votes += count
    end
  end

  # Pourcentage de votes du candidat par rapport à l'ensemble des candidats.
  # Retourne un nombre (flottant) entre 0 et 100.
  def score
    if @@total_votes > 0
      @votes.to_f / @@total_votes * 100
    else
      0
    end
  end

  # Indique si le candidat est vainqueur à la majorité absolue.
  # Retourne `true` si, et seulement si, le score du candidat est strictement supérieur à 50.
  def absolute_winner?
    score > 50.0
  end

  def self.winners
    if winner = @@candidates.find(&:absolute_winner?)
      [winner]
    else
      @@candidates.max_by(2, &:score)
    end
  end

end