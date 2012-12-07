class Board
  attr_accessor :cells

  def initialize(rows, cols)
    @rows, @cols = rows, cols
    @cells = CellCollection.new

    init_dead_cells
  end

  def init_dead_cells
    @rows.times do |x|
      @cols.times do |y|
        @cells.add_cell_at Cell.new(:dead), x, y
      end
    end
  end

  def draw
    system('clear')

    @rows.times do |x|
      @cols.times do |y|
        print @cells.cell_at(x,y).to_s
      end

      print "\n"
    end
  end

  def evolve!
    @cells.evolve!(@rows, @cols)
  end

  def tick
    draw
    evolve!
  end

  def all_dead?
    @cells.all_dead?
  end

  def init_plus_pattern(x, y)
    @cells.cell_at(x,y).birth!
    @cells.cell_at(x, y-1).birth!
    @cells.cell_at(x-1, y).birth!
    @cells.cell_at(x, y+1).birth!
    @cells.cell_at(x+1, y).birth!
  end

  def random(times)
    @rows.times do |x|
      @cols.times do |y|
        cell = @cells.cell_at(x, y)
        cell.die!
        cell.birth! if rand(times) == 1
      end
    end
  end
end
