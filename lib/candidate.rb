 class Candidate

  # name : nom du candidat.
  # votes : nombre de votes du candidat.
  attr_reader :name, :votes

  def initialize(name)
    # TODO
  end

  # Augmente le nombre de votes du candidat par la quantité spécifiée.
  def add_votes(count)
    # TODO
  end

  # Pourcentage de votes du candidat par rapport à l'ensemble des candidats.
  # Retourne un nombre (flottant) entre 0 et 100.
  def score
    # TODO
  end

  # Indique si le candidat est vainqueur à la majorité absolue.
  # Retourne `true` si, et seulement si, le score du candidat est strictement supérieur à 50.
  def absolute_winner?
    # TODO
  end

end
