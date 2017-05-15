class Candidate

  # Nom du candidat
  attr_reader :name

  # Cumul du nombre de votes des classements
  # pour lesquels ce candidat est premier
  attr_accessor :votes

  # Nombre de victoires en comparaisons
  # 2 par 2
  attr_accessor :victories

  def initialize(name)
    @name = name
    @votes = 0
    @victories = 0
  end

end