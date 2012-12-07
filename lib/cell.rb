class Cell
  attr_accessor :neighbours
  attr_accessor :board

  def initialize(board, state = :dead)
    @state = state
    @board = board
  end

  def to_s
    return " " if dead?
    return "+" if alive?
  end

  def alive_neighbours_length
    neighbours.select(&:alive?).length
  end

  def calculate_next_step
    @mark_for_death = alive_neighbours_length < 2 || alive_neighbours_length > 3
    @mark_for_birth = alive_neighbours_length == 3
  end

  def marked?
    @mark_for_birth || @mark_for_death
  end

  def evolve!
    die! if @mark_for_death
    birth! if @mark_for_birth
  end

  def dead?;  @state == :dead; end
  def alive?; @state == :alive; end

  def die!;   @state = :dead;  end
  def birth!; @state = :alive; end
end
