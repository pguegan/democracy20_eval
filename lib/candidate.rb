class Candidate

  attr_reader :name
  attr_accessor :votes

  def initialize(name)
    @name = name
    @votes = 0
  end

end