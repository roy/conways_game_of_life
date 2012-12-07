class CellCollection
  attr_accessor :cells

  def initialize
    @cells = Hash.new(Cell.new(:dead))
  end

  def add_cell_at(cell, x, y)
    @cells[[x,y]] = cell
  end

  def cell_at(x, y)
    @cells[[x,y]]
  end

  def neighbours_for(x, y)
    positions = [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
      [x, y-1], [x, y + 1],
      [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
    ]

    positions.collect{ |pos_x,pos_y| cell_at(pos_x,pos_y) }
  end

  def all_dead?
    @cells.all? do |pos, cell|
      cell.dead?
    end
  end

  def evolve!(rows, cols)
    affected = []

    rows.times do |x|
      cols.times do |y|
        cell = cell_at(x,y)
        cell.neighbours = neighbours_for(x, y)
        cell.calculate_next_step
        affected << cell if cell.marked? 
      end
    end

    affected.each(&:evolve!)
  end
end
