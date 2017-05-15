class Candidate

  # Nom du candidat
  attr_reader :name

  # Cumul du nombre de votes des classements
  # pour lesquels ce candidat est premier
  attr_accessor :votes

  def initialize(name)
    @name = name
    @votes = 0
  end

end